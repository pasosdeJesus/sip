# encoding: utf-8

class CreaActorsocialPersona < ActiveRecord::Migration[5.2]
  def change
    create_table :sip_actorsocial_persona do |t|
      t.integer :persona_id, null: false
      t.integer :actorsocial_id
      t.integer :perfilactorsocial_id
      t.timestamp :created_at, null: false
      t.timestamp :updated_at, null: false
    end
    add_foreign_key :sip_actorsocial_persona, :sip_actorsocial,
      column: :actorsocial_id
    add_foreign_key :sip_actorsocial_persona, :sip_persona,
      column: :persona_id
  end
end
