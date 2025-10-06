
output "rbak_s3_bucket_versioning" {

     value = aws_s3_bucket.rbak_s3_bucket.versioning[0].enabled

}

output "rbak_s3_bucket_complete_details" {

     value = aws_s3_bucket.rbak_s3_bucket

}


output "rbak_iam_user_complete_details" {

     value = aws_iam_user.rbak_iam_user

}