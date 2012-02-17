class Policy
  include Mongoid::Document
  field :id
  field :name

  field :status
  field :productName
  field :clientName
  field :lastActivityDate
  field :polNumber
  field :strippedOffIPolNumber
  field :premiumAmount

  field :contactId
  field :contactName
  field :contactEmail

  field :modalPremiumAmount
  field :officeCode
  field :lineOfBusiness
  field :issueState
  field :policyDate
  field :uwId
  field :uwName
  field :uwEmail

  field :lastActivityDateStr
  field :productLabel
  field :ownerName
  field :amount
  field :appEntryDate
  field :sourceSystem

  field :benefitInfo
  field :cashWithApp
  field :productType
  field :underWriterId
  field :pendRecId
  field :companyCode

  embeds_many :clients
  embeds_many :agents
  embeds_one :product
  embeds_many :outstandingRequirements

end

class Client
  include Mongoid::Document

  field :role
  field :sequence
  field :lastName
  field :firstName
  field :age
  field :middleName
  field :dateOfBirth
  field :sex
  field :ssn
  field :tobaccoDescription
  field :tobaccoRating
  field :clientRecId

  embedded_in :policy

end

class Product
  include Mongoid::Document

  field :type
  field :desc

  embedded_in :policy

end


class Agent
  include Mongoid::Document

  field :fullName
  field :agentId
  field :lastName
  field :firstName
  field :middleName
  field :splitPercent
  field :agentNumber
  field :agentRecId

  embedded_in :policy

end

class OutstandingRequirement
  include Mongoid::Document

  field :requirementName

  embedded_in :policy

end