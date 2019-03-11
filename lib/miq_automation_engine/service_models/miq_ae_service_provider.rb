module MiqAeMethodService
  class MiqAeServiceProvider < MiqAeServiceModelBase
    expose :zone,                  :association => true
    expose :tenant,                :association => true
    expose :managers,              :association => true
  end

  def remote_console_url=(url)
    object_send(:remote_console_url=, url, DRb.front.workspace.ae_user.id)
  end
end
