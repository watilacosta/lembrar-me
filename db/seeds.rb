# Seeds
puts "Seeding database..."

# Create Admin
User.create!(name:  "Admin", email: "admin@gmail.com", password: "12345678", role: :admin)

# Create users
client        = User.create!(name: "João Silva", email: "joao.silva@example.com", password: "12345678", role: 0)
professional  = User.create!(name: "Manoel Pereira", email: "manoel.p@example.com", password: "12345678", role: 1)
professional2 = User.create!(name: "Maria Oliveira", email: "maria.oliveira@example.com", password: "12345678", role: 1)
professional3 = User.create!(name: "Ana Souza", email: "ana.souza@example", password: "12345678", role: 1)

# Create Services
service1 = Service.create!(
  user: professional,
  title: "Consulta Online",
  description: "Atendimento personalizado via vídeo-chamada.",
  price: 150.00
)
service2 = Service.create!(
  user: professional,
  title: "Aula de Inglês",
  description: "Aula particular para todos os níveis.",
  price: 120.00
)

# Create Appointments
Appointment.create!(service: service1, client: client, scheduled_at: 2.days.from_now, status: 0)
Appointment.create!(service: service2, client: client, scheduled_at: 3.days.from_now, status: 1)

# Create schedules
Schedule.create!(user: professional, available_at: 1.day.from_now, booked: false)
Schedule.create!(user: professional, available_at: 2.days.from_now, booked: true)

# Create plans
basic_plan   = Plan.create!(name: "Básico", price: 19.90)
pro_plan     = Plan.create!(name: "Pro", price: 29.90)
premium_plan = Plan.create!(name: "Premium", price: 49.90)

# Create subscriptions
subscription1 = Subscription.create!(
  user: professional,
  plan: basic_plan,
  starts_at: Date.today,
  ends_at: Date.today + 30.days,
  status: "active",
  duration_in_days: 30
)

subscription2 = Subscription.create!(
  user: professional2,
  plan: pro_plan,
  starts_at: Date.today,
  ends_at: Date.today + 120.days,
  status: "active",
  duration_in_days: 120
)

subscription3 = Subscription.create!(
  user: professional3,
  plan: premium_plan,
  starts_at: Date.today,
  ends_at: Date.today + 365.days,
  status: "pending",
  duration_in_days: 365
)

# Create subscription payments
SubscriptionPayment.create!(
  subscription: subscription1,
  amount: 19.90,
  status: "paid",
  paid_at: Time.now,
  payment_method: "credit_card"
)

SubscriptionPayment.create!(
  subscription: subscription2,
  amount: 29.90,
  status: "paid",
  paid_at: Time.now,
  payment_method: "credit_card"
)

SubscriptionPayment.create!(
  subscription: subscription3,
  amount: 49.90,
  status: "failed",
  paid_at: Time.now,
  payment_method: "credit_card"
)

puts "Seeding complete!"
