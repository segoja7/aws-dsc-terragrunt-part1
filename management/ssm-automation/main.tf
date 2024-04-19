resource "aws_ssm_document" "dsc-automation" {
  name            = "dsc-automation"
  document_type   = "Automation"
  document_format = "YAML"

  content = templatefile("${path.module}/documents/automation.yaml", {
    instance_id = var.instance_id
    Assume_role = aws_iam_role.dsc-automationssm-role.arn
  })
}

resource "aws_ssm_document" "dsc-script" {
  name            = "dsc-script"
  document_type   = "Command"
  document_format = "YAML"

  content = templatefile("${path.module}/documents/dsc-script.yaml", {
    names3bucket = var.s3_bucket_id
  })
}

resource "aws_ssm_association" "dsc-association" {
  name             = aws_ssm_document.dsc-automation.name
  association_name = aws_ssm_document.dsc-automation.name
  #  apply_only_at_cron_interval = true
  parameters = {
    Instance = var.instance_id
  }

}


resource "aws_iam_role" "dsc-automationssm-role" {
  name = "wsfc-automationssm-role"
  assume_role_policy = jsonencode(
    {
      "Version" : "2012-10-17",
      "Statement" : [
        {
          "Effect" : "Allow",
          "Principal" : {
            "Service" : [
              "ssm.amazonaws.com"
            ]
          },
          "Action" : "sts:AssumeRole",
          "Condition" : {
            "StringEquals" : {
              "aws:SourceAccount" : "${data.aws_caller_identity.current.account_id}"
            },
            "ArnLike" : {
              "aws:SourceArn" : "arn:aws:ssm:*:${data.aws_caller_identity.current.account_id}:automation-execution/*"
            }
          }
        }
      ]
    }
  )
}

resource "aws_iam_role_policy_attachment" "dsc-policy-attachment" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonSSMAutomationRole"
  role       = aws_iam_role.dsc-automationssm-role.name
}

