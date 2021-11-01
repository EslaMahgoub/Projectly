# for more details see: http://emberjs.com/guides/models/defining-models/

RailsProject.Project = DS.Model.extend
  name: DS.attr 'string'
  startDate: DS.attr 'date'
  deliveryDate: DS.attr 'date'
  company: DS.belongsTo 'company'
  user: DS.belongsTo 'user'
  sourceLanguage: DS.belongsTo 'sourceLanguage'
  description: DS.attr 'string'
  instructions: DS.attr 'string'
  referenceFile: DS.attr 'string'
  sourceFile: DS.attr 'string'
