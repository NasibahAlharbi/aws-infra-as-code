# CD12352 - Infrastructure as Code Project Solution
# [ nasibah alharbi ]

## Spin up instructions
TODO

## Tear down instructions
TODO

## Other considerations
TODO (optional)
udagramSSHKey
aws ec2 create-key-pair --key-name udagramSSHKey --query 'KeyMaterial' --output text > udagramSSHKey.pem

aws secretsmanager create-secret --name udagramSSHKey --secret-string file://udagramSSHKey.pem

Resource handler returned message: "The subnet ID 'subnet-046b6400e7da744c4,subnet-0cb29f25dff32709b' does not exist (Service: Ec2, Status Code: 400, Request ID: 82d02c76-560a-4c45-84dc-9bffc2d99c41)" (RequestToken: 0332c081-59d8-1a9a-6830-74822249bb8a, HandlerErrorCode: InvalidRequest)

1 validation error detected: Value 'Value for parameter -----BEGIN RSA PRIVATE KEY----- MIIEpAIBAAKCAQEAy/xc5R0s3qA8VS5rrQ6EnVOSqRisvHXjWl00dxeEpjlbvYoqwN1EPj0HbBAmy29we2kBH6eH/XaGneltyfHrnOgMyRlyUTv9styRX6DhsxHagJh4 tprwm2k819ES19beKXCqWAYsx3KFkYyBKgSED3OuCwL5Uh4iprmhiLLncMRm6tPrtJO0xFCepfymlYtajya0yUUylVSRw08e78ZfcVjwJjDbZatFm0Ncks1KiMqJ/kgX hcwQbnEvpajkuR4I0g77WqlbGaR07L/kowMq5bvpLKb+0FLSSMbnkjZP7h4KAbDvjmJ4kgis3YmCfC4VwC3OvExHiI1isaOsyl+ZAwIDAQABAoIBAC3wFF+IlX1BarTo MlmTxmvD0WiBZQ1AI0ZLbTBQvI/OpQlnXz911ROLHOvKK2JvI063lAgz6106XxCa7B2pfJ0maRK0x1jiAL1SDO8TRSDVqXaCX9UHyZ3GMmyL6glvmzKL6+DM6zKzaL8h fEkhITh1ncFfFxTWMomHjohBefub6FZmhyrlRBSetOVE8WROyCOD2zh7h4zXJDi/kEbGYx0xpoKDqW5o5Xor+6N4fK4JE2ILBKChhBqKGo4sntQg96Y+xs9I6i8LUrLB Zt+VTar6+wXeMKZq5wtkmuidGdiHH80d08Z1VcAtTHk5b51KoYphf021otVx+huOsXDexSECgYEA8cf5b1Y9TANg6W7dxipWye4mHtZ79btl/Ex1HikUgvvnlqSkIjw/ hFxwljzA1+Up39ULvPteuQfVMJJqg/pPo7PUuNjhH5AQgXUV+ShC80KA7kiKHvDHffMfw2MOfty1kRuyArKZglzLgEWcDEx3Wd6szlnQmz69QFIuSFkM/rMCgYEA1/tg tixXOY8W6rECWXNElZWkI72gfi9PpbgBIjq9sU+Qiq1g4AyAIzpkbUtp61Ydj7Ck2QdzLI6NVoIcsXUk4fvKJ+Xr8EJiQtagt0Uvct33xEpglO5HOTxr5tjlnm0Puk21 yCIrpzVXmOOFKriz/wq3PvIe+FQ0x5zdU2HmJHECgYEA6EnsB1+ffIwya5MsVtsOjurSjQYcCjaFASSj0No+7qj+EukTGCEyFQSK1ox/6ewtkvKoWGRY2QQBeqzw0OOH 6As58G3Nu/k5ImdPORXJXNUj8cqXiKpjv0n51kow/wklF8i3+YeFnI1ypkY6akZ81EbvV0FK/hwEzusltDR6G6kCgYEAkahgUruYn6LWi7SQpw7LxC3FIq1yHWd+yX5M lW8UGw5TppLC8Ja9nAR3UhY3+pR7Hzq8EfmqPPRucVcSTsN3+ke60CmJcuDyL61bef3YwBjeTazzcb04n2sWQfso8C0RHE3oOG6DDiM1TlCysFscWPY7GuJi7IqthalO wjsV4KECgYA5qVHzTJZvvRHgovts+t4SntJ605vlXgmCQ4tiVOo7rrec0JILFEUoOsQ5FDqlEEzop68cchSxUve+k0dwgPaUOToCNTlnQkWoAWx5amJIgxb9gRgq7/UN HNyG36VylJ/fVE2+z6ptvRFMfywNv2ewAqQmYkNSgjCtDIP0Zy93+g==-----END RSA PRIVATE KEY----- is invalid. Length exceeds maximum of 255. (Service: Ec2, Status Code: 400, Request ID: 3336aafa-213e-4113-8cf4-f07d21ce077e)' at 'statusMessage' failed to satisfy constraint: Member must have length less than or equal to 1024


  # BastionIP2:
  #   Description: IP2 of the Bastion Host
  #   Value: !GetAtt BastionHostInstance2.PublicIp
  
  # BastionHostInstance2:
  #   Type: AWS::EC2::Instance
  #   Properties:
  #     InstanceType: t2.micro
  #     ImageId: ami-0557a15b87f6559cf
  #     KeyName: udagramSSHKey
  #     NetworkInterfaces:
  #       - AssociatePublicIpAddress: 'true'
  #         DeviceIndex: '0'
  #         SubnetId: 
  #           Fn::ImportValue: 
  #             !Sub "${ProjectName}-PUB2-SN"  
  #         GroupSet:
  #           - !Ref BastionSecurityGroup