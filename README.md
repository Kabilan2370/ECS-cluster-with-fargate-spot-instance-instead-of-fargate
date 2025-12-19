# ECS-cluster-with-fargate-spot-instance-instead-of-fargate

## What is AWS ECS Fargate ? 
AWS ECS Fargate is a serverless compute engine for running containers on Amazon ECS (Elastic Container Service). The run containers will run without managing servers or infrastructure.

## Why we are using fargate spot instead of fargate ?
We use Fargate Spot instead of standard Fargate mainly for cost savings. Fargate Spot is up to ~70% cheaper than regular Fargate. You’re paying less because AWS uses spare capacity.

## What is Application Load Balancer ?
An Application Load Balancer is an AWS service that distributes incoming application traffic across multiple targets at the application layer (Layer 7).

1. Using CI/CD workflows files butild and push the docker images into AWS ECR repo.
2. Create a neccessary services via terraform.
3. Create a target group and application load balancer then attach with ecs services.
4. Create a ECS Cluster, Task definition and services
5. Pull and attach that docker image on ecs task definition.
6. While launch the ECS cluster mention the FARGATE SPOT
7. Created 2 alarm and cloud watch dashboard and Log management group.
   

7
