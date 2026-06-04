name_prefix = "eks-may26"

#vpc and subnets
vpc_cidr = "10.0.0.0/16"

public_subnet = {
  public-1 = {
    name                    = "public-1"
    cidr_block              = "10.0.1.0/24"
    availability_zone       = "eu-west-2a"
    map_public_ip_on_launch = true
  }
  public-2 = {
    name                    = "public-2"
    cidr_block              = "10.0.2.0/24"
    availability_zone       = "eu-west-2b"
    map_public_ip_on_launch = true
  }
}

private_subnet = {
  private-1 = {
    name              = "private-1"
    cidr_block        = "10.0.11.0/24"
    availability_zone = "eu-west-2a"
  }
  private-2 = {
    name              = "private-2"
    cidr_block        = "10.0.12.0/24"
    availability_zone = "eu-west-2b"
  }
}

# #eks cluster config
# eks_version = 1.35
# authentication_mode = "API_AND_CONFIG_MAP"

#s3 bucket
application = "medireports"
environment = "prod"
region = "eu-west-2"
cost_centre = "HC-2042"
owner = "clinical-ops" 

deletion_window_in_days = 7
rotation_period_in_days = 90