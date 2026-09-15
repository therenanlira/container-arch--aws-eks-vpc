# container-arch--aws-eks-vpc

Rede do cluster EKS do projeto `ct-arch`. Instancia o módulo [`vpc_network`](https://github.com/therenanlira/container-arch--aws-eks-modules/tree/main/vpc_network) e publica os IDs da VPC no SSM Parameter Store, de onde o [`container-arch--aws-eks`](https://github.com/therenanlira/container-arch--aws-eks) lê.

## Pré-requisitos

- Terraform `~> 1.13`
- Credenciais AWS da conta `150100906110`
- Bucket de state `150100906110--terraform-backend` em `us-east-2`
- Repo de módulos clonado ao lado deste (o `source` é um caminho relativo):

  ```
  git/
  ├── container-arch--aws-eks-modules/
  └── container-arch--aws-eks-vpc/
  ```

## Estrutura

```
terraform/
├── environment/
│   └── prd/
│       ├── backend.tfvars     # bucket, key e região do state
│       └── terraform.tfvars   # valores do ambiente
├── vpc.tf                     # chamada do módulo vpc_network
└── _*.tf                      # backend, providers, variáveis e locals
```

## Uso

```bash
cd terraform
terraform init -backend-config=environment/prd/backend.tfvars
terraform plan -var-file=environment/prd/terraform.tfvars -out=plan.tfplan
terraform apply plan.tfplan
```

Aplique este repo antes do `container-arch--aws-eks` e destrua depois dele.

## Variáveis

| Nome | Descrição | `prd` |
| --- | --- | --- |
| `account_id` | Única conta aceita pelo provider | `150100906110` |
| `region` | Região da VPC | `us-east-2` |
| `environment` | Ambiente | `prd` |
| `project_name` | Nome do projeto, usado em nomes e tags | `ct-arch` |
| `vpc_cidr` | CIDR primário da VPC | `10.0.0.0/16` |
| `eks_cidr` | CIDR secundário para os pods do EKS. Vazio desliga | `100.64.0.0/16` |

## Resultado

- State em `ct-arch/prd/aws-eks-vpc/terraform.tfstate`
- SSM Parameter `/prd/us-east-2/ct-arch/vpc-network`, com os IDs de VPC, subnets e route tables

Layout das subnets e formato do parâmetro: [README do módulo](https://github.com/therenanlira/container-arch--aws-eks-modules/tree/main/vpc_network).
