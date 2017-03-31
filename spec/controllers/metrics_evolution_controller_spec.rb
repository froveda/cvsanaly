require 'rails_helper'

describe MetricsEvolutionController do
  describe 'with guest user' do
    context 'Get #metrics_evolution' do
      it_behaves_like 'redirect to login path when no user is logged in', :metrics_evolution
    end

    context 'Get #metrics_evolution_filtered' do
      it_behaves_like 'redirect to login path when no user is logged in', :metrics_evolution_filtered
    end
  end

  describe 'with user logged in' do
    login_user
    it_behaves_like 'access to :metrics_evolution with user logged in'
    it_behaves_like 'access to :metrics_evolution_filtered with user logged in'
  end

  describe 'with admin logged in' do
    login_admin
    it_behaves_like 'access to :metrics_evolution with user logged in'
    it_behaves_like 'access to :metrics_evolution_filtered with user logged in'
  end
end