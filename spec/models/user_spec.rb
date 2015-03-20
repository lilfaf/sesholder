require 'rails_helper'

describe User do
  it { is_expected.to have_db_column(:email).with_options(null: false) }
  it { is_expected.to have_db_index(:email).unique }
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_uniqueness_of(:email) }
  it { is_expected.to allow_value('valid@email.com', 'v@email.co').for(:email) }
  it { is_expected.not_to allow_value('notemail.com', '.not@email.c').for(:email) }
end