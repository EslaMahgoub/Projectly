# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Company.create(name: 'Milengo')
Company.create(name: 'The Client Company')

Role.create(name: :admin)
Role.create(name: :client)

SourceLanguage.create(name: 'English', code: 'en')
SourceLanguage.create(name: 'German', code: 'de')

TargetLanguage.create(name: 'German (Germany)', code: 'de-DE')
TargetLanguage.create(name: 'Portuguese (Portugal)', code: 'pt-PT')


SubjectArea.create(name: 'Aerospace')
SubjectArea.create(name: 'Agriculture')
SubjectArea.create(name: 'Automotive')