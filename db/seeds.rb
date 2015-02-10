Report.delete_all
Agency.delete_all
User.delete_all

user = User.create!(email:'q@q.com', username: 'Sparrow', password:'password')
agent1 = Agency.create!(name: 'FBI', jurisdiction: 'Federal')
agent2 = Agency.create!(name: 'Massachusetts State Police', jurisdiction: 'State')
agent3 = Agency.create!(name: 'New York Police Department', jurisdiction: 'City')

Report.create!(name:'John', state:'MA', city:'Boston', incident_date:'2001-03-02', verified: true, agency_id: agent1.id, user_id: user.id)
Report.create!(name:'John', state:'MA', city:'Boston', incident_date:'2001-03-02', verified: true, agency_id: agent2.id, user_id: user.id)
Report.create!(name:'John', state:'MA', city:'Boston', incident_date:'2001-03-02', verified: true, agency_id: agent3.id, user_id: user.id)
Report.create!(name:'John', state:'MA', city:'Boston', incident_date:'2001-03-02', verified: false)
Report.create!(name:'John', state:'MA', city:'Boston', incident_date:'2001-03-02', verified: false)

Report.create!(name:'John Smithington', state:'MA', city:'Boston', incident_date:'2001-03-02', verified: true, agency_id: agent3.id, user_id: user.id)
Report.create!(name:'John Smithington', state:'MA', city:'Boston', incident_date:'2001-03-02', verified: true, agency_id: agent3.id, user_id: user.id)
Report.create!(name:'John Smithington', state:'MA', city:'Boston', incident_date:'2001-03-02', verified: true, agency_id: agent3.id, user_id: user.id)
Report.create!(name:'John Smithington', state:'MA', city:'Boston', incident_date:'2001-03-02', verified: true, agency_id: agent3.id, user_id: user.id)
Report.create!(name:'John Smithington', state:'MA', city:'Boston', incident_date:'2001-03-02', verified: true, agency_id: agent3.id, user_id: user.id)
Report.create!(name:'John Smithington', state:'MA', city:'Boston', incident_date:'2001-03-02', verified: true, agency_id: agent3.id, user_id: user.id)
Report.create!(name:'John Smithington', state:'MA', city:'Boston', incident_date:'2001-03-02', verified: true, agency_id: agent3.id, user_id: user.id)
Report.create!(name:'John Smithington', state:'MA', city:'Boston', incident_date:'2001-03-02', verified: true, agency_id: agent3.id, user_id: user.id)
Report.create!(name:'John Smithington', state:'MA', city:'Boston', incident_date:'2001-03-02', verified: true, agency_id: agent3.id, user_id: user.id)
Report.create!(name:'John Smithington', state:'MA', city:'Boston', incident_date:'2001-03-02', verified: true, agency_id: agent3.id, user_id: user.id)
Report.create!(name:'John Smithington', state:'MA', city:'Boston', incident_date:'2001-03-02', verified: true, agency_id: agent3.id, user_id: user.id)
Report.create!(name:'John Smithington', state:'MA', city:'Boston', incident_date:'2001-03-02', verified: true, agency_id: agent3.id, user_id: user.id)
Report.create!(name:'John Smithington', state:'MA', city:'Boston', incident_date:'2001-03-02', verified: true, agency_id: agent3.id, user_id: user.id)
Report.create!(name:'John Smithington', state:'MA', city:'Boston', incident_date:'2001-03-02', verified: true, agency_id: agent3.id, user_id: user.id)
Report.create!(name:'John Smithington', state:'MA', city:'Boston', incident_date:'2001-03-02', verified: true, agency_id: agent3.id, user_id: user.id)
Report.create!(name:'John Smithington', state:'MA', city:'Boston', incident_date:'2001-03-02', verified: true, agency_id: agent3.id, user_id: user.id)
Report.create!(name:'John Smithington', state:'MA', city:'Boston', incident_date:'2001-03-02', verified: true, agency_id: agent3.id, user_id: user.id)
Report.create!(name:'John Smithington', state:'MA', city:'Boston', incident_date:'2001-03-02', verified: true, agency_id: agent3.id, user_id: user.id)
Report.create!(name:'John Smithington', state:'MA', city:'Boston', incident_date:'2001-03-02', verified: true, agency_id: agent3.id, user_id: user.id)
