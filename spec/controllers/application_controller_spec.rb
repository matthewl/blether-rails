require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
  # Our test account
  let!(:account) { create(:account) }

  # Headers for authorization
  let(:headers) { { 'Authorization' => token_generator(account.id) } }
  let(:invalid_headers) { { 'Authorization' => nil } }

  describe '#authorize_request' do
    context 'when auth token is present' do
      before { allow(request).to receive(:headers).and_return(headers) }

      it 'sets the current account' do
        expect(subject.instance_eval { authorize_request }).to eq(account)
      end
    end

    context 'when auth token is not passed' do
      before { allow(request).to receive(:headers).and_return(invalid_headers) }

      it 'raises the MissingToken error' do
        expect { subject.instance_eval { authorize_request } }.to raise_error(ExceptionHandler::MissingToken, /Missing token/)
      end
    end
  end
end