Report.delete_all
Agency.delete_all

Report.create!(name:'John', state:'MA', city:'Boston', month:'05', day:'11', year:'2001', verified: true)
Report.create!(name:'John', state:'MA', city:'Boston', month:'05', day:'11', year:'2001', verified: true)
Report.create!(name:'John', state:'MA', city:'Boston', month:'05', day:'11', year:'2001', verified: true)
Report.create!(name:'John', state:'MA', city:'Boston', month:'05', day:'11', year:'2001', verified: false)
Report.create!(name:'John', state:'MA', city:'Boston', month:'05', day:'11', year:'2001', verified: false)
Agency.create!(name: 'FBI', jurisdiction: 'Federal')
Agency.create!(name: 'Massachusetts State Police', jurisdiction: 'State')
Agency.create!(name: 'New York Police Department', jurisdiction: 'City')
