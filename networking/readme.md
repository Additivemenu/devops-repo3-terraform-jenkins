This `main.tf` file defines the networking infrastructure for your project. Let's break it down section by section:

1. Variable Declarations:

   ```bash
   variable "vpc_cidr" {}
   variable "vpc_name" {}
   variable "cidr_public_subnet" {}
   variable "eu_availability_zone" {}
   variable "cidr_private_subnet" {}

   ```

   These declare the variables used in this module, which are likely defined in your `terraform.tfvars` file.

2. Outputs:

   ```bash
   output "dev_proj_1_vpc_id" { ... }
   output "dev_proj_1_public_subnets" { ... }
   output "public_subnet_cidr_block" { ... }

   ```

   These define values that will be output after Terraform applies the configuration, allowing other parts of your infrastructure to reference these resources.

3. VPC Creation:

   ```bash
   resource "aws_vpc" "dev_proj_1_vpc_eu_central_1" { ... }

   ```

   This creates a VPC with the specified CIDR block and name.

4. Public Subnets:

   ```bash
   resource "aws_subnet" "dev_proj_1_public_subnets" { ... }

   ```

   This creates public subnets in the VPC. It uses `count` to create multiple subnets based on the number of CIDR blocks provided.

5. Private Subnets:

   ```bash
   resource "aws_subnet" "dev_proj_1_private_subnets" { ... }

   ```

   Similar to public subnets, this creates private subnets in the VPC.

6. Internet Gateway:

   ```bash
   resource "aws_internet_gateway" "dev_proj_1_public_internet_gateway" { ... }

   ```

   This creates an Internet Gateway and attaches it to the VPC, allowing communication between the VPC and the internet.

7. Public Route Table:

   ```bash
   resource "aws_route_table" "dev_proj_1_public_route_table" { ... }

   ```

   This creates a route table for public subnets, with a route to the Internet Gateway.

8. Public Route Table Association:

   ```bash
   resource "aws_route_table_association" "dev_proj_1_public_rt_subnet_association" { ... }

   ```

   This associates the public route table with the public subnets.

9. Private Route Table:

   ```bash
   resource "aws_route_table" "dev_proj_1_private_subnets" { ... }

   ```

   This creates a route table for private subnets. Note that there's a commented-out `depends_on` block, suggesting a NAT Gateway might be added later.

10. Private Route Table Association:

    ```bash
    resource "aws_route_table_association" "dev_proj_1_private_rt_subnet_association" { ... }

    ```

    This associates the private route table with the private subnets.

This configuration sets up a VPC with both public and private subnets across multiple availability zones,

- along with the necessary routing to allow public subnets to access the internet.
- The private subnets are isolated from direct internet access, which is a common security practice.

The use of `count` and `element()` functions allows for creating multiple subnets dynamically based on the input variables, making this configuration flexible and reusable.
