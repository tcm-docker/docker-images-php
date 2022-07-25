# DO NOT EDIT THIS FILE Make yours changes in /utils/docker-bake.blueprint.hcl

group "default" {
   targets = [
     
     "php81",
     "php80",
     "php74",
     "php73",
     "php72",
   ]
}

group "php81" {
   targets = [
     "php81-slim-apache",
     "php81-apache",
     "php81-apache-node16","php81-apache-node14","php81-apache-node12","php81-apache-node10","php81-slim-fpm",
     "php81-fpm",
     "php81-fpm-node16","php81-fpm-node14","php81-fpm-node12","php81-fpm-node10","php81-slim-cli",
     "php81-cli",
     "php81-cli-node16","php81-cli-node14","php81-cli-node12","php81-cli-node10",
   ]
}
group "php80" {
   targets = [
     "php80-slim-apache",
     "php80-apache",
     "php80-apache-node16","php80-apache-node14","php80-apache-node12","php80-apache-node10","php80-slim-fpm",
     "php80-fpm",
     "php80-fpm-node16","php80-fpm-node14","php80-fpm-node12","php80-fpm-node10","php80-slim-cli",
     "php80-cli",
     "php80-cli-node16","php80-cli-node14","php80-cli-node12","php80-cli-node10",
   ]
}
group "php74" {
   targets = [
     "php74-slim-apache",
     "php74-apache",
     "php74-apache-node16","php74-apache-node14","php74-apache-node12","php74-apache-node10","php74-slim-fpm",
     "php74-fpm",
     "php74-fpm-node16","php74-fpm-node14","php74-fpm-node12","php74-fpm-node10","php74-slim-cli",
     "php74-cli",
     "php74-cli-node16","php74-cli-node14","php74-cli-node12","php74-cli-node10",
   ]
}
group "php73" {
   targets = [
     "php73-slim-apache",
     "php73-apache",
     "php73-apache-node16","php73-apache-node14","php73-apache-node12","php73-apache-node10","php73-slim-fpm",
     "php73-fpm",
     "php73-fpm-node16","php73-fpm-node14","php73-fpm-node12","php73-fpm-node10","php73-slim-cli",
     "php73-cli",
     "php73-cli-node16","php73-cli-node14","php73-cli-node12","php73-cli-node10",
   ]
}
group "php72" {
   targets = [
     "php72-slim-apache",
     "php72-apache",
     "php72-apache-node16","php72-apache-node14","php72-apache-node12","php72-apache-node10","php72-slim-fpm",
     "php72-fpm",
     "php72-fpm-node16","php72-fpm-node14","php72-fpm-node12","php72-fpm-node10","php72-slim-cli",
     "php72-cli",
     "php72-cli-node16","php72-cli-node14","php72-cli-node12","php72-cli-node10",
   ]
}

variable "REPO" {default = "thecodingmachine/php"}
variable "PHP_PATCH_MINOR" {default = ""}
variable "GLOBAL_VERSION" {default = "v4"}

function "tag" {
    params = [PHP_VERSION, VARIANT, PHP_MINOR]
    result = [
        "${REPO}:${PHP_VERSION}-${GLOBAL_VERSION}-${VARIANT}",
        notequal("",PHP_MINOR) ? "${REPO}:${PHP_MINOR}-${GLOBAL_VERSION}-${VARIANT}": "",
    ]
}

target "default" {
  context = "."
  args = {
    GLOBAL_VERSION = "${GLOBAL_VERSION}"
  }
  platforms = ["linux/amd64"]
  pull = true
  #output = ["customDir"]
  #output = ["type=tar,dest=myimage.tar"]
  output = ["type=docker"] # load in local docker
  #output = ["type=registry"] # push
  #output = ["type=image"] # push also ?
}


###########################
##    PHP 8.1
###########################
# thecodingmachine/php:8.1-v4-slim-apache
target "php81-slim-apache" {
  inherits = ["default"]
  tags = tag("8.1", "slim-apache", "${PHP_PATCH_MINOR}")
  dockerfile = "Dockerfile.slim.apache"
  args = {
    PHP_VERSION = "8.1"
    VARIANT = "apache"
  }
}

# thecodingmachine/php:8.1-v4-apache
target "php81-apache" {
  inherits = ["default"]
  tags = tag("8.1", "apache", "${PHP_PATCH_MINOR}")
  dockerfile = "Dockerfile.apache"
  args = {
    PHP_VERSION = "8.1"
    VARIANT = "apache"
  }
}

# thecodingmachine/php:8.1-v4-apache-node16
target "php81-apache-node16" {
  inherits = ["default"]
  tags = tag("8.1", "apache-node16", "${PHP_PATCH_MINOR}")
  dockerfile = "Dockerfile.apache.node16"
  args = {
    PHP_VERSION = "8.1"
    VARIANT = "apache-node16"
  }
}

# thecodingmachine/php:8.1-v4-apache-node14
target "php81-apache-node14" {
  inherits = ["default"]
  tags = tag("8.1", "apache-node14", "${PHP_PATCH_MINOR}")
  dockerfile = "Dockerfile.apache.node14"
  args = {
    PHP_VERSION = "8.1"
    VARIANT = "apache-node14"
  }
}

# thecodingmachine/php:8.1-v4-apache-node12
target "php81-apache-node12" {
  inherits = ["default"]
  tags = tag("8.1", "apache-node12", "${PHP_PATCH_MINOR}")
  dockerfile = "Dockerfile.apache.node12"
  args = {
    PHP_VERSION = "8.1"
    VARIANT = "apache-node12"
  }
}

# thecodingmachine/php:8.1-v4-apache-node10
target "php81-apache-node10" {
  inherits = ["default"]
  tags = tag("8.1", "apache-node10", "${PHP_PATCH_MINOR}")
  dockerfile = "Dockerfile.apache.node10"
  args = {
    PHP_VERSION = "8.1"
    VARIANT = "apache-node10"
  }
}

###########################
##    PHP 8.1
###########################
# thecodingmachine/php:8.1-v4-slim-fpm
target "php81-slim-fpm" {
  inherits = ["default"]
  tags = tag("8.1", "slim-fpm", "${PHP_PATCH_MINOR}")
  dockerfile = "Dockerfile.slim.fpm"
  args = {
    PHP_VERSION = "8.1"
    VARIANT = "fpm"
  }
}

# thecodingmachine/php:8.1-v4-fpm
target "php81-fpm" {
  inherits = ["default"]
  tags = tag("8.1", "fpm", "${PHP_PATCH_MINOR}")
  dockerfile = "Dockerfile.fpm"
  args = {
    PHP_VERSION = "8.1"
    VARIANT = "fpm"
  }
}

# thecodingmachine/php:8.1-v4-fpm-node16
target "php81-fpm-node16" {
  inherits = ["default"]
  tags = tag("8.1", "fpm-node16", "${PHP_PATCH_MINOR}")
  dockerfile = "Dockerfile.fpm.node16"
  args = {
    PHP_VERSION = "8.1"
    VARIANT = "fpm-node16"
  }
}

# thecodingmachine/php:8.1-v4-fpm-node14
target "php81-fpm-node14" {
  inherits = ["default"]
  tags = tag("8.1", "fpm-node14", "${PHP_PATCH_MINOR}")
  dockerfile = "Dockerfile.fpm.node14"
  args = {
    PHP_VERSION = "8.1"
    VARIANT = "fpm-node14"
  }
}

# thecodingmachine/php:8.1-v4-fpm-node12
target "php81-fpm-node12" {
  inherits = ["default"]
  tags = tag("8.1", "fpm-node12", "${PHP_PATCH_MINOR}")
  dockerfile = "Dockerfile.fpm.node12"
  args = {
    PHP_VERSION = "8.1"
    VARIANT = "fpm-node12"
  }
}

# thecodingmachine/php:8.1-v4-fpm-node10
target "php81-fpm-node10" {
  inherits = ["default"]
  tags = tag("8.1", "fpm-node10", "${PHP_PATCH_MINOR}")
  dockerfile = "Dockerfile.fpm.node10"
  args = {
    PHP_VERSION = "8.1"
    VARIANT = "fpm-node10"
  }
}

###########################
##    PHP 8.1
###########################
# thecodingmachine/php:8.1-v4-slim-cli
target "php81-slim-cli" {
  inherits = ["default"]
  tags = tag("8.1", "slim-cli", "${PHP_PATCH_MINOR}")
  dockerfile = "Dockerfile.slim.cli"
  args = {
    PHP_VERSION = "8.1"
    VARIANT = "cli"
  }
}

# thecodingmachine/php:8.1-v4-cli
target "php81-cli" {
  inherits = ["default"]
  tags = tag("8.1", "cli", "${PHP_PATCH_MINOR}")
  dockerfile = "Dockerfile.cli"
  args = {
    PHP_VERSION = "8.1"
    VARIANT = "cli"
  }
}

# thecodingmachine/php:8.1-v4-cli-node16
target "php81-cli-node16" {
  inherits = ["default"]
  tags = tag("8.1", "cli-node16", "${PHP_PATCH_MINOR}")
  dockerfile = "Dockerfile.cli.node16"
  args = {
    PHP_VERSION = "8.1"
    VARIANT = "cli-node16"
  }
}

# thecodingmachine/php:8.1-v4-cli-node14
target "php81-cli-node14" {
  inherits = ["default"]
  tags = tag("8.1", "cli-node14", "${PHP_PATCH_MINOR}")
  dockerfile = "Dockerfile.cli.node14"
  args = {
    PHP_VERSION = "8.1"
    VARIANT = "cli-node14"
  }
}

# thecodingmachine/php:8.1-v4-cli-node12
target "php81-cli-node12" {
  inherits = ["default"]
  tags = tag("8.1", "cli-node12", "${PHP_PATCH_MINOR}")
  dockerfile = "Dockerfile.cli.node12"
  args = {
    PHP_VERSION = "8.1"
    VARIANT = "cli-node12"
  }
}

# thecodingmachine/php:8.1-v4-cli-node10
target "php81-cli-node10" {
  inherits = ["default"]
  tags = tag("8.1", "cli-node10", "${PHP_PATCH_MINOR}")
  dockerfile = "Dockerfile.cli.node10"
  args = {
    PHP_VERSION = "8.1"
    VARIANT = "cli-node10"
  }
}

###########################
##    PHP 8.0
###########################
# thecodingmachine/php:8.0-v4-slim-apache
target "php80-slim-apache" {
  inherits = ["default"]
  tags = tag("8.0", "slim-apache", "${PHP_PATCH_MINOR}")
  dockerfile = "Dockerfile.slim.apache"
  args = {
    PHP_VERSION = "8.0"
    VARIANT = "apache"
  }
}

# thecodingmachine/php:8.0-v4-apache
target "php80-apache" {
  inherits = ["default"]
  tags = tag("8.0", "apache", "${PHP_PATCH_MINOR}")
  dockerfile = "Dockerfile.apache"
  args = {
    PHP_VERSION = "8.0"
    VARIANT = "apache"
  }
}

# thecodingmachine/php:8.0-v4-apache-node16
target "php80-apache-node16" {
  inherits = ["default"]
  tags = tag("8.0", "apache-node16", "${PHP_PATCH_MINOR}")
  dockerfile = "Dockerfile.apache.node16"
  args = {
    PHP_VERSION = "8.0"
    VARIANT = "apache-node16"
  }
}

# thecodingmachine/php:8.0-v4-apache-node14
target "php80-apache-node14" {
  inherits = ["default"]
  tags = tag("8.0", "apache-node14", "${PHP_PATCH_MINOR}")
  dockerfile = "Dockerfile.apache.node14"
  args = {
    PHP_VERSION = "8.0"
    VARIANT = "apache-node14"
  }
}

# thecodingmachine/php:8.0-v4-apache-node12
target "php80-apache-node12" {
  inherits = ["default"]
  tags = tag("8.0", "apache-node12", "${PHP_PATCH_MINOR}")
  dockerfile = "Dockerfile.apache.node12"
  args = {
    PHP_VERSION = "8.0"
    VARIANT = "apache-node12"
  }
}

# thecodingmachine/php:8.0-v4-apache-node10
target "php80-apache-node10" {
  inherits = ["default"]
  tags = tag("8.0", "apache-node10", "${PHP_PATCH_MINOR}")
  dockerfile = "Dockerfile.apache.node10"
  args = {
    PHP_VERSION = "8.0"
    VARIANT = "apache-node10"
  }
}

###########################
##    PHP 8.0
###########################
# thecodingmachine/php:8.0-v4-slim-fpm
target "php80-slim-fpm" {
  inherits = ["default"]
  tags = tag("8.0", "slim-fpm", "${PHP_PATCH_MINOR}")
  dockerfile = "Dockerfile.slim.fpm"
  args = {
    PHP_VERSION = "8.0"
    VARIANT = "fpm"
  }
}

# thecodingmachine/php:8.0-v4-fpm
target "php80-fpm" {
  inherits = ["default"]
  tags = tag("8.0", "fpm", "${PHP_PATCH_MINOR}")
  dockerfile = "Dockerfile.fpm"
  args = {
    PHP_VERSION = "8.0"
    VARIANT = "fpm"
  }
}

# thecodingmachine/php:8.0-v4-fpm-node16
target "php80-fpm-node16" {
  inherits = ["default"]
  tags = tag("8.0", "fpm-node16", "${PHP_PATCH_MINOR}")
  dockerfile = "Dockerfile.fpm.node16"
  args = {
    PHP_VERSION = "8.0"
    VARIANT = "fpm-node16"
  }
}

# thecodingmachine/php:8.0-v4-fpm-node14
target "php80-fpm-node14" {
  inherits = ["default"]
  tags = tag("8.0", "fpm-node14", "${PHP_PATCH_MINOR}")
  dockerfile = "Dockerfile.fpm.node14"
  args = {
    PHP_VERSION = "8.0"
    VARIANT = "fpm-node14"
  }
}

# thecodingmachine/php:8.0-v4-fpm-node12
target "php80-fpm-node12" {
  inherits = ["default"]
  tags = tag("8.0", "fpm-node12", "${PHP_PATCH_MINOR}")
  dockerfile = "Dockerfile.fpm.node12"
  args = {
    PHP_VERSION = "8.0"
    VARIANT = "fpm-node12"
  }
}

# thecodingmachine/php:8.0-v4-fpm-node10
target "php80-fpm-node10" {
  inherits = ["default"]
  tags = tag("8.0", "fpm-node10", "${PHP_PATCH_MINOR}")
  dockerfile = "Dockerfile.fpm.node10"
  args = {
    PHP_VERSION = "8.0"
    VARIANT = "fpm-node10"
  }
}

###########################
##    PHP 8.0
###########################
# thecodingmachine/php:8.0-v4-slim-cli
target "php80-slim-cli" {
  inherits = ["default"]
  tags = tag("8.0", "slim-cli", "${PHP_PATCH_MINOR}")
  dockerfile = "Dockerfile.slim.cli"
  args = {
    PHP_VERSION = "8.0"
    VARIANT = "cli"
  }
}

# thecodingmachine/php:8.0-v4-cli
target "php80-cli" {
  inherits = ["default"]
  tags = tag("8.0", "cli", "${PHP_PATCH_MINOR}")
  dockerfile = "Dockerfile.cli"
  args = {
    PHP_VERSION = "8.0"
    VARIANT = "cli"
  }
}

# thecodingmachine/php:8.0-v4-cli-node16
target "php80-cli-node16" {
  inherits = ["default"]
  tags = tag("8.0", "cli-node16", "${PHP_PATCH_MINOR}")
  dockerfile = "Dockerfile.cli.node16"
  args = {
    PHP_VERSION = "8.0"
    VARIANT = "cli-node16"
  }
}

# thecodingmachine/php:8.0-v4-cli-node14
target "php80-cli-node14" {
  inherits = ["default"]
  tags = tag("8.0", "cli-node14", "${PHP_PATCH_MINOR}")
  dockerfile = "Dockerfile.cli.node14"
  args = {
    PHP_VERSION = "8.0"
    VARIANT = "cli-node14"
  }
}

# thecodingmachine/php:8.0-v4-cli-node12
target "php80-cli-node12" {
  inherits = ["default"]
  tags = tag("8.0", "cli-node12", "${PHP_PATCH_MINOR}")
  dockerfile = "Dockerfile.cli.node12"
  args = {
    PHP_VERSION = "8.0"
    VARIANT = "cli-node12"
  }
}

# thecodingmachine/php:8.0-v4-cli-node10
target "php80-cli-node10" {
  inherits = ["default"]
  tags = tag("8.0", "cli-node10", "${PHP_PATCH_MINOR}")
  dockerfile = "Dockerfile.cli.node10"
  args = {
    PHP_VERSION = "8.0"
    VARIANT = "cli-node10"
  }
}

###########################
##    PHP 7.4
###########################
# thecodingmachine/php:7.4-v4-slim-apache
target "php74-slim-apache" {
  inherits = ["default"]
  tags = tag("7.4", "slim-apache", "${PHP_PATCH_MINOR}")
  dockerfile = "Dockerfile.slim.apache"
  args = {
    PHP_VERSION = "7.4"
    VARIANT = "apache"
  }
}

# thecodingmachine/php:7.4-v4-apache
target "php74-apache" {
  inherits = ["default"]
  tags = tag("7.4", "apache", "${PHP_PATCH_MINOR}")
  dockerfile = "Dockerfile.apache"
  args = {
    PHP_VERSION = "7.4"
    VARIANT = "apache"
  }
}

# thecodingmachine/php:7.4-v4-apache-node16
target "php74-apache-node16" {
  inherits = ["default"]
  tags = tag("7.4", "apache-node16", "${PHP_PATCH_MINOR}")
  dockerfile = "Dockerfile.apache.node16"
  args = {
    PHP_VERSION = "7.4"
    VARIANT = "apache-node16"
  }
}

# thecodingmachine/php:7.4-v4-apache-node14
target "php74-apache-node14" {
  inherits = ["default"]
  tags = tag("7.4", "apache-node14", "${PHP_PATCH_MINOR}")
  dockerfile = "Dockerfile.apache.node14"
  args = {
    PHP_VERSION = "7.4"
    VARIANT = "apache-node14"
  }
}

# thecodingmachine/php:7.4-v4-apache-node12
target "php74-apache-node12" {
  inherits = ["default"]
  tags = tag("7.4", "apache-node12", "${PHP_PATCH_MINOR}")
  dockerfile = "Dockerfile.apache.node12"
  args = {
    PHP_VERSION = "7.4"
    VARIANT = "apache-node12"
  }
}

# thecodingmachine/php:7.4-v4-apache-node10
target "php74-apache-node10" {
  inherits = ["default"]
  tags = tag("7.4", "apache-node10", "${PHP_PATCH_MINOR}")
  dockerfile = "Dockerfile.apache.node10"
  args = {
    PHP_VERSION = "7.4"
    VARIANT = "apache-node10"
  }
}

###########################
##    PHP 7.4
###########################
# thecodingmachine/php:7.4-v4-slim-fpm
target "php74-slim-fpm" {
  inherits = ["default"]
  tags = tag("7.4", "slim-fpm", "${PHP_PATCH_MINOR}")
  dockerfile = "Dockerfile.slim.fpm"
  args = {
    PHP_VERSION = "7.4"
    VARIANT = "fpm"
  }
}

# thecodingmachine/php:7.4-v4-fpm
target "php74-fpm" {
  inherits = ["default"]
  tags = tag("7.4", "fpm", "${PHP_PATCH_MINOR}")
  dockerfile = "Dockerfile.fpm"
  args = {
    PHP_VERSION = "7.4"
    VARIANT = "fpm"
  }
}

# thecodingmachine/php:7.4-v4-fpm-node16
target "php74-fpm-node16" {
  inherits = ["default"]
  tags = tag("7.4", "fpm-node16", "${PHP_PATCH_MINOR}")
  dockerfile = "Dockerfile.fpm.node16"
  args = {
    PHP_VERSION = "7.4"
    VARIANT = "fpm-node16"
  }
}

# thecodingmachine/php:7.4-v4-fpm-node14
target "php74-fpm-node14" {
  inherits = ["default"]
  tags = tag("7.4", "fpm-node14", "${PHP_PATCH_MINOR}")
  dockerfile = "Dockerfile.fpm.node14"
  args = {
    PHP_VERSION = "7.4"
    VARIANT = "fpm-node14"
  }
}

# thecodingmachine/php:7.4-v4-fpm-node12
target "php74-fpm-node12" {
  inherits = ["default"]
  tags = tag("7.4", "fpm-node12", "${PHP_PATCH_MINOR}")
  dockerfile = "Dockerfile.fpm.node12"
  args = {
    PHP_VERSION = "7.4"
    VARIANT = "fpm-node12"
  }
}

# thecodingmachine/php:7.4-v4-fpm-node10
target "php74-fpm-node10" {
  inherits = ["default"]
  tags = tag("7.4", "fpm-node10", "${PHP_PATCH_MINOR}")
  dockerfile = "Dockerfile.fpm.node10"
  args = {
    PHP_VERSION = "7.4"
    VARIANT = "fpm-node10"
  }
}

###########################
##    PHP 7.4
###########################
# thecodingmachine/php:7.4-v4-slim-cli
target "php74-slim-cli" {
  inherits = ["default"]
  tags = tag("7.4", "slim-cli", "${PHP_PATCH_MINOR}")
  dockerfile = "Dockerfile.slim.cli"
  args = {
    PHP_VERSION = "7.4"
    VARIANT = "cli"
  }
}

# thecodingmachine/php:7.4-v4-cli
target "php74-cli" {
  inherits = ["default"]
  tags = tag("7.4", "cli", "${PHP_PATCH_MINOR}")
  dockerfile = "Dockerfile.cli"
  args = {
    PHP_VERSION = "7.4"
    VARIANT = "cli"
  }
}

# thecodingmachine/php:7.4-v4-cli-node16
target "php74-cli-node16" {
  inherits = ["default"]
  tags = tag("7.4", "cli-node16", "${PHP_PATCH_MINOR}")
  dockerfile = "Dockerfile.cli.node16"
  args = {
    PHP_VERSION = "7.4"
    VARIANT = "cli-node16"
  }
}

# thecodingmachine/php:7.4-v4-cli-node14
target "php74-cli-node14" {
  inherits = ["default"]
  tags = tag("7.4", "cli-node14", "${PHP_PATCH_MINOR}")
  dockerfile = "Dockerfile.cli.node14"
  args = {
    PHP_VERSION = "7.4"
    VARIANT = "cli-node14"
  }
}

# thecodingmachine/php:7.4-v4-cli-node12
target "php74-cli-node12" {
  inherits = ["default"]
  tags = tag("7.4", "cli-node12", "${PHP_PATCH_MINOR}")
  dockerfile = "Dockerfile.cli.node12"
  args = {
    PHP_VERSION = "7.4"
    VARIANT = "cli-node12"
  }
}

# thecodingmachine/php:7.4-v4-cli-node10
target "php74-cli-node10" {
  inherits = ["default"]
  tags = tag("7.4", "cli-node10", "${PHP_PATCH_MINOR}")
  dockerfile = "Dockerfile.cli.node10"
  args = {
    PHP_VERSION = "7.4"
    VARIANT = "cli-node10"
  }
}

###########################
##    PHP 7.3
###########################
# thecodingmachine/php:7.3-v4-slim-apache
target "php73-slim-apache" {
  inherits = ["default"]
  tags = tag("7.3", "slim-apache", "${PHP_PATCH_MINOR}")
  dockerfile = "Dockerfile.slim.apache"
  args = {
    PHP_VERSION = "7.3"
    VARIANT = "apache"
  }
}

# thecodingmachine/php:7.3-v4-apache
target "php73-apache" {
  inherits = ["default"]
  tags = tag("7.3", "apache", "${PHP_PATCH_MINOR}")
  dockerfile = "Dockerfile.apache"
  args = {
    PHP_VERSION = "7.3"
    VARIANT = "apache"
  }
}

# thecodingmachine/php:7.3-v4-apache-node16
target "php73-apache-node16" {
  inherits = ["default"]
  tags = tag("7.3", "apache-node16", "${PHP_PATCH_MINOR}")
  dockerfile = "Dockerfile.apache.node16"
  args = {
    PHP_VERSION = "7.3"
    VARIANT = "apache-node16"
  }
}

# thecodingmachine/php:7.3-v4-apache-node14
target "php73-apache-node14" {
  inherits = ["default"]
  tags = tag("7.3", "apache-node14", "${PHP_PATCH_MINOR}")
  dockerfile = "Dockerfile.apache.node14"
  args = {
    PHP_VERSION = "7.3"
    VARIANT = "apache-node14"
  }
}

# thecodingmachine/php:7.3-v4-apache-node12
target "php73-apache-node12" {
  inherits = ["default"]
  tags = tag("7.3", "apache-node12", "${PHP_PATCH_MINOR}")
  dockerfile = "Dockerfile.apache.node12"
  args = {
    PHP_VERSION = "7.3"
    VARIANT = "apache-node12"
  }
}

# thecodingmachine/php:7.3-v4-apache-node10
target "php73-apache-node10" {
  inherits = ["default"]
  tags = tag("7.3", "apache-node10", "${PHP_PATCH_MINOR}")
  dockerfile = "Dockerfile.apache.node10"
  args = {
    PHP_VERSION = "7.3"
    VARIANT = "apache-node10"
  }
}

###########################
##    PHP 7.3
###########################
# thecodingmachine/php:7.3-v4-slim-fpm
target "php73-slim-fpm" {
  inherits = ["default"]
  tags = tag("7.3", "slim-fpm", "${PHP_PATCH_MINOR}")
  dockerfile = "Dockerfile.slim.fpm"
  args = {
    PHP_VERSION = "7.3"
    VARIANT = "fpm"
  }
}

# thecodingmachine/php:7.3-v4-fpm
target "php73-fpm" {
  inherits = ["default"]
  tags = tag("7.3", "fpm", "${PHP_PATCH_MINOR}")
  dockerfile = "Dockerfile.fpm"
  args = {
    PHP_VERSION = "7.3"
    VARIANT = "fpm"
  }
}

# thecodingmachine/php:7.3-v4-fpm-node16
target "php73-fpm-node16" {
  inherits = ["default"]
  tags = tag("7.3", "fpm-node16", "${PHP_PATCH_MINOR}")
  dockerfile = "Dockerfile.fpm.node16"
  args = {
    PHP_VERSION = "7.3"
    VARIANT = "fpm-node16"
  }
}

# thecodingmachine/php:7.3-v4-fpm-node14
target "php73-fpm-node14" {
  inherits = ["default"]
  tags = tag("7.3", "fpm-node14", "${PHP_PATCH_MINOR}")
  dockerfile = "Dockerfile.fpm.node14"
  args = {
    PHP_VERSION = "7.3"
    VARIANT = "fpm-node14"
  }
}

# thecodingmachine/php:7.3-v4-fpm-node12
target "php73-fpm-node12" {
  inherits = ["default"]
  tags = tag("7.3", "fpm-node12", "${PHP_PATCH_MINOR}")
  dockerfile = "Dockerfile.fpm.node12"
  args = {
    PHP_VERSION = "7.3"
    VARIANT = "fpm-node12"
  }
}

# thecodingmachine/php:7.3-v4-fpm-node10
target "php73-fpm-node10" {
  inherits = ["default"]
  tags = tag("7.3", "fpm-node10", "${PHP_PATCH_MINOR}")
  dockerfile = "Dockerfile.fpm.node10"
  args = {
    PHP_VERSION = "7.3"
    VARIANT = "fpm-node10"
  }
}

###########################
##    PHP 7.3
###########################
# thecodingmachine/php:7.3-v4-slim-cli
target "php73-slim-cli" {
  inherits = ["default"]
  tags = tag("7.3", "slim-cli", "${PHP_PATCH_MINOR}")
  dockerfile = "Dockerfile.slim.cli"
  args = {
    PHP_VERSION = "7.3"
    VARIANT = "cli"
  }
}

# thecodingmachine/php:7.3-v4-cli
target "php73-cli" {
  inherits = ["default"]
  tags = tag("7.3", "cli", "${PHP_PATCH_MINOR}")
  dockerfile = "Dockerfile.cli"
  args = {
    PHP_VERSION = "7.3"
    VARIANT = "cli"
  }
}

# thecodingmachine/php:7.3-v4-cli-node16
target "php73-cli-node16" {
  inherits = ["default"]
  tags = tag("7.3", "cli-node16", "${PHP_PATCH_MINOR}")
  dockerfile = "Dockerfile.cli.node16"
  args = {
    PHP_VERSION = "7.3"
    VARIANT = "cli-node16"
  }
}

# thecodingmachine/php:7.3-v4-cli-node14
target "php73-cli-node14" {
  inherits = ["default"]
  tags = tag("7.3", "cli-node14", "${PHP_PATCH_MINOR}")
  dockerfile = "Dockerfile.cli.node14"
  args = {
    PHP_VERSION = "7.3"
    VARIANT = "cli-node14"
  }
}

# thecodingmachine/php:7.3-v4-cli-node12
target "php73-cli-node12" {
  inherits = ["default"]
  tags = tag("7.3", "cli-node12", "${PHP_PATCH_MINOR}")
  dockerfile = "Dockerfile.cli.node12"
  args = {
    PHP_VERSION = "7.3"
    VARIANT = "cli-node12"
  }
}

# thecodingmachine/php:7.3-v4-cli-node10
target "php73-cli-node10" {
  inherits = ["default"]
  tags = tag("7.3", "cli-node10", "${PHP_PATCH_MINOR}")
  dockerfile = "Dockerfile.cli.node10"
  args = {
    PHP_VERSION = "7.3"
    VARIANT = "cli-node10"
  }
}

###########################
##    PHP 7.2
###########################
# thecodingmachine/php:7.2-v4-slim-apache
target "php72-slim-apache" {
  inherits = ["default"]
  tags = tag("7.2", "slim-apache", "${PHP_PATCH_MINOR}")
  dockerfile = "Dockerfile.slim.apache"
  args = {
    PHP_VERSION = "7.2"
    VARIANT = "apache"
  }
}

# thecodingmachine/php:7.2-v4-apache
target "php72-apache" {
  inherits = ["default"]
  tags = tag("7.2", "apache", "${PHP_PATCH_MINOR}")
  dockerfile = "Dockerfile.apache"
  args = {
    PHP_VERSION = "7.2"
    VARIANT = "apache"
  }
}

# thecodingmachine/php:7.2-v4-apache-node16
target "php72-apache-node16" {
  inherits = ["default"]
  tags = tag("7.2", "apache-node16", "${PHP_PATCH_MINOR}")
  dockerfile = "Dockerfile.apache.node16"
  args = {
    PHP_VERSION = "7.2"
    VARIANT = "apache-node16"
  }
}

# thecodingmachine/php:7.2-v4-apache-node14
target "php72-apache-node14" {
  inherits = ["default"]
  tags = tag("7.2", "apache-node14", "${PHP_PATCH_MINOR}")
  dockerfile = "Dockerfile.apache.node14"
  args = {
    PHP_VERSION = "7.2"
    VARIANT = "apache-node14"
  }
}

# thecodingmachine/php:7.2-v4-apache-node12
target "php72-apache-node12" {
  inherits = ["default"]
  tags = tag("7.2", "apache-node12", "${PHP_PATCH_MINOR}")
  dockerfile = "Dockerfile.apache.node12"
  args = {
    PHP_VERSION = "7.2"
    VARIANT = "apache-node12"
  }
}

# thecodingmachine/php:7.2-v4-apache-node10
target "php72-apache-node10" {
  inherits = ["default"]
  tags = tag("7.2", "apache-node10", "${PHP_PATCH_MINOR}")
  dockerfile = "Dockerfile.apache.node10"
  args = {
    PHP_VERSION = "7.2"
    VARIANT = "apache-node10"
  }
}

###########################
##    PHP 7.2
###########################
# thecodingmachine/php:7.2-v4-slim-fpm
target "php72-slim-fpm" {
  inherits = ["default"]
  tags = tag("7.2", "slim-fpm", "${PHP_PATCH_MINOR}")
  dockerfile = "Dockerfile.slim.fpm"
  args = {
    PHP_VERSION = "7.2"
    VARIANT = "fpm"
  }
}

# thecodingmachine/php:7.2-v4-fpm
target "php72-fpm" {
  inherits = ["default"]
  tags = tag("7.2", "fpm", "${PHP_PATCH_MINOR}")
  dockerfile = "Dockerfile.fpm"
  args = {
    PHP_VERSION = "7.2"
    VARIANT = "fpm"
  }
}

# thecodingmachine/php:7.2-v4-fpm-node16
target "php72-fpm-node16" {
  inherits = ["default"]
  tags = tag("7.2", "fpm-node16", "${PHP_PATCH_MINOR}")
  dockerfile = "Dockerfile.fpm.node16"
  args = {
    PHP_VERSION = "7.2"
    VARIANT = "fpm-node16"
  }
}

# thecodingmachine/php:7.2-v4-fpm-node14
target "php72-fpm-node14" {
  inherits = ["default"]
  tags = tag("7.2", "fpm-node14", "${PHP_PATCH_MINOR}")
  dockerfile = "Dockerfile.fpm.node14"
  args = {
    PHP_VERSION = "7.2"
    VARIANT = "fpm-node14"
  }
}

# thecodingmachine/php:7.2-v4-fpm-node12
target "php72-fpm-node12" {
  inherits = ["default"]
  tags = tag("7.2", "fpm-node12", "${PHP_PATCH_MINOR}")
  dockerfile = "Dockerfile.fpm.node12"
  args = {
    PHP_VERSION = "7.2"
    VARIANT = "fpm-node12"
  }
}

# thecodingmachine/php:7.2-v4-fpm-node10
target "php72-fpm-node10" {
  inherits = ["default"]
  tags = tag("7.2", "fpm-node10", "${PHP_PATCH_MINOR}")
  dockerfile = "Dockerfile.fpm.node10"
  args = {
    PHP_VERSION = "7.2"
    VARIANT = "fpm-node10"
  }
}

###########################
##    PHP 7.2
###########################
# thecodingmachine/php:7.2-v4-slim-cli
target "php72-slim-cli" {
  inherits = ["default"]
  tags = tag("7.2", "slim-cli", "${PHP_PATCH_MINOR}")
  dockerfile = "Dockerfile.slim.cli"
  args = {
    PHP_VERSION = "7.2"
    VARIANT = "cli"
  }
}

# thecodingmachine/php:7.2-v4-cli
target "php72-cli" {
  inherits = ["default"]
  tags = tag("7.2", "cli", "${PHP_PATCH_MINOR}")
  dockerfile = "Dockerfile.cli"
  args = {
    PHP_VERSION = "7.2"
    VARIANT = "cli"
  }
}

# thecodingmachine/php:7.2-v4-cli-node16
target "php72-cli-node16" {
  inherits = ["default"]
  tags = tag("7.2", "cli-node16", "${PHP_PATCH_MINOR}")
  dockerfile = "Dockerfile.cli.node16"
  args = {
    PHP_VERSION = "7.2"
    VARIANT = "cli-node16"
  }
}

# thecodingmachine/php:7.2-v4-cli-node14
target "php72-cli-node14" {
  inherits = ["default"]
  tags = tag("7.2", "cli-node14", "${PHP_PATCH_MINOR}")
  dockerfile = "Dockerfile.cli.node14"
  args = {
    PHP_VERSION = "7.2"
    VARIANT = "cli-node14"
  }
}

# thecodingmachine/php:7.2-v4-cli-node12
target "php72-cli-node12" {
  inherits = ["default"]
  tags = tag("7.2", "cli-node12", "${PHP_PATCH_MINOR}")
  dockerfile = "Dockerfile.cli.node12"
  args = {
    PHP_VERSION = "7.2"
    VARIANT = "cli-node12"
  }
}

# thecodingmachine/php:7.2-v4-cli-node10
target "php72-cli-node10" {
  inherits = ["default"]
  tags = tag("7.2", "cli-node10", "${PHP_PATCH_MINOR}")
  dockerfile = "Dockerfile.cli.node10"
  args = {
    PHP_VERSION = "7.2"
    VARIANT = "cli-node10"
  }
}


