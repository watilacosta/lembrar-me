# 📌 Plataforma de Agendamentos Profissionais

## 📖 Sobre o Projeto

Este é um sistema SaaS desenvolvido em **Ruby on Rails 8* com **Hotwire** para facilitar o agendamento de serviços entre clientes e profissionais. Os profissionais podem oferecer serviços pagos, e os clientes podem agendar horários disponíveis. O sistema inclui integração com pagamentos e gerenciamento de assinaturas.

## 🚀 Tecnologias Utilizadas

- **Ruby on Rails 8**
- **Hotwire (Turbo + Stimulus)**
- **Devise** (Autenticação)
- **Pagar.me / Stripe** (Pagamentos)
- **SQLite** (Banco de dados)
- **Docker** (Ambiente de desenvolvimento)

## 📂 Estrutura do Projeto

```bash
📦 my-app
 ┣ 📂 app
 ┃ ┣ 📂 controllers
 ┃ ┣ 📂 models
 ┃ ┣ 📂 views
 ┃ ┣ 📂 javascript (Stimulus Controllers)
 ┣ 📂 config
 ┣ 📂 db
 ┃ ┣ 📂 migrations
 ┃ ┣ seeds.rb
 ┣ 📂 test (Testes automatizados)
 ┣ 📜 Gemfile
 ┣ 📜 README.md
```

## 📦 Como Rodar o Projeto

### 1️⃣ Clonar o repositório

```bash
git clone https://github.com/watilacosta/lembrar-me
cd lembrar-me
```

### 2️⃣ Configurar o ambiente

```bash
bundle install
rails bin/setup
```

### 3️⃣ Iniciar o servidor

```bash
rails s
```

Acesse: `http://localhost:3000`

## 🛠️ Funcionalidades

✅ Cadastro e login de usuários (Clientes e Profissionais)\
✅ Criação e gerenciamento de serviços\
✅ Agendamento de horários disponíveis\
✅ Confirmação e cancelamento de agendamentos\
✅ Processamento de pagamentos\
✅ Painel para profissionais gerenciarem seus serviços

## 📌 Próximos Passos

- Melhorar interface do usuário (Hotwire interativo)
- Implementar notificações por email
- Criar API para integração com aplicativos móveis

## 🤝 Contribuição

Contribuições são bem-vindas! Abra uma issue ou envie um pull request.

## 📄 Licença

Este projeto é open-source sob a licença MIT.

---

🚀 **Feito com 💖 por Wátila Costa**

