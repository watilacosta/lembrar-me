# Seeds
puts "Seeding database..."

# Create users
client = User.create!(name: "João Silva", email: "joao.silva@example.com", password: "12345678", role: 0)
professional = User.create!(name: "Manoel Pereira", email: "manoel.p@example.com", password: "12345678", role: 1)

# Create Services
service1 = Service.create!(user: professional, title: "Consulta Online", description: "Atendimento personalizado via vídeo-chamada.", price: 150.00)
service2 = Service.create!(user: professional, title: "Aula de Inglês", description: "Aula particular para todos os níveis.", price: 120.00)

# Create Appointments
Appointment.create!(service: service1, client: client, scheduled_at: 2.days.from_now, status: 0)
Appointment.create!(service: service2, client: client, scheduled_at: 3.days.from_now, status: 1)

# Create schedules
Schedule.create!(user: professional, available_at: 1.day.from_now, booked: false)
Schedule.create!(user: professional, available_at: 2.days.from_now, booked: true)

puts "Seeding complete!"
