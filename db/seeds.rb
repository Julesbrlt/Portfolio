puts "📌 Resetting database..."
Resume.destroy_all
Experience.destroy_all
Education.destroy_all
Skill.destroy_all
Language.destroy_all
Interest.destroy_all

puts "✅ Old data cleared."

# === RESUME ===
resume = Resume.create!(
  title: "CV – Web Developer & Digital Marketing",
  summary: "Après l’obtention d’un Master 2 en Digital Marketing, j’ai suivi la formation Web Dev “Le Wagon”. Passionné par le code et l’esport, je recherche un poste dans le développement web que j’affectionne particulièrement.",
  pdf_url: "public/Web_Dev_CV.pdf" # Mets ton vrai chemin si tu as un PDF
)

puts "🎓 Resume créé."

# === EXPERIENCES ===
experiences = [
  {
    title: "Accounting Intern",
    company: "Pro-Experts",
    start_date: Date.new(2020,1,1),
    end_date: Date.new(2020,6,1),
    description: "Saisie et vérification des transactions financières, rapprochement des comptes et participation à la préparation des états financiers."
  },
  {
    title: "Waiter",
    company: "Bar Poupoune",
    start_date: Date.new(2021,6,1),
    end_date: Date.new(2024,8,1),
    description: "Service clientèle en environnement à fort volume, gestion des commandes, respect des normes d’hygiène et soutien logistique."
  },
  {
    title: "Audit Intern",
    company: "Kube Group",
    start_date: Date.new(2023,1,1),
    end_date: Date.new(2023,6,1),
    description: "Participation à des audits financiers et opérationnels, analyse des registres comptables et assistance à la préparation des rapports."
  }
]

experiences.each { |exp| resume.experiences.create!(exp) }
puts "💼 Expériences ajoutées."

# === EDUCATION ===
educations = [
  {
    school: "Le Wagon",
    degree: "Web Development Bootcamp",
    start_date: Date.new(2025,1,1),
    end_date: Date.new(2025,3,1),
    description: "Maîtrise des langages Ruby, JS, HTML, CSS. Utilisation de PostgreSQL et SQLite, pratique du pattern MVC, maîtrise de Rails. Projets collaboratifs déployés sur Heroku."
  },
  {
    school: "Kedge Business School",
    degree: "IBBA Program",
    start_date: Date.new(2019,9,1),
    end_date: Date.new(2024,6,1),
    description: "Études en marketing, business et droit, spécialisation finance. Cours dispensés en anglais avec projet d’investissement. Expérience en communication pour une association."
  },
  {
    school: "McMaster University (Canada)",
    degree: "Finance specialization",
    start_date: Date.new(2021,9,1),
    end_date: Date.new(2022,6,1),
    description: "Évaluation d’entreprises, analyse de ratios, M&A. Maîtrise de l’anglais technique avancé."
  },
  {
    school: "Carlos III de Madrid",
    degree: "Marketing specialization",
    start_date: Date.new(2022,9,1),
    end_date: Date.new(2023,6,1),
    description: "Études de stratégies marketing et comportement consommateur."
  },
  {
    school: "Kedge Business School",
    degree: "MSc Digital Marketing & Sales",
    start_date: Date.new(2024,9,1),
    end_date: Date.new(2025,6,1),
    description: "Développement de stratégies digitales, campagnes SEO/SEA, email marketing et suivi des KPIs."
  },
]

educations.each { |edu| resume.educations.create!(edu) }
puts "🎓 Formations ajoutées."

# === SKILLS ===
skills = [
  { name: "Ruby on Rails", category: "Programming", level: "Avancé" },
  { name: "JavaScript", category: "Programming", level: "Intermédiaire" },
  { name: "HTML & CSS", category: "Programming", level: "Avancé" },
  { name: "PostgreSQL", category: "Database", level: "Intermédiaire" },
  { name: "GitHub", category: "Tools", level: "Avancé" },
  { name: "Heroku", category: "Tools", level: "Avancé" },
  { name: "Adobe Suite", category: "Design", level: "Intermédiare" },
  { name: "Google Ads", category: "Marketing", level: "Certified" },
  { name: "WordPress", category: "CMS", level: "Intermédiaire" },
  { name: "Shopify", category: "CMS", level: "Intermédiaire" },
  { name: "Excel", category: "Tools", level: "Avancé" }
]

skills.each { |s| resume.skills.create!(s) }
puts "🛠️ Compétences ajoutées."

# === LANGUAGES ===
languages = [
  { name: "Français", level: "Natif" },
  { name: "Anglais", level: "C1 (TOEIC 970)" },
  { name: "Espagnol", level: "B2" }
]

languages.each { |l| resume.languages.create!(l) }
puts "🌍 Langues ajoutées."

# === INTERESTS ===
interests = [
  { name: "Sport", description: "Tennis et padel en loisir" },
  { name: "Esport", description: "Champion d’Europe sur Teamfight Tactics, streams réguliers devant plusieurs centaines de viewers, contrat d’un an avec une organisation esport, gains de 5000€." }
]

interests.each { |i| resume.interests.create!(i) }
puts "🎯 Centres d’intérêt ajoutés."

puts "✅ Seed terminée avec succès !"
