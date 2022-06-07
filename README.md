# README

Aplicação web para restaurantes/lanchonetes, com funcionalidade de aluguel de mesas, criação de cardápio, produtos, com estoque e precificação. Além de sistema de comandas com pagamento integral ou parcial de contas por aplicativo. 
Possui implementação para integração com aplicação mobile. 

## Fast Development

* Ruby version

```
 2.6.5
```

* Setup

# Set Ruby Version

```
  rvm install 2.6.5

  or

  rbenv install 2.6.5
```

### After Install Ruby Version

```
  rvm 2.6.5
  
  or

  rbenv local 2.6.5
```

# Run App

## Dependencies

```
  gem install bundler:2.1.4
  bundle install
```

## Database
  Postegresql 0.21.0 

```
  copy .env-sample file and rename with .env
```

```
  set values of the environment variables
```

### Create and setup database

```
  rails db:create
  
  rails db:migrate

  rails db:seed
```

## Start Serve

```
  rails s
```

### After seeds, you can log with this admin account: 

```
  email: admin@garcon.com
  senha: garcon123
```

