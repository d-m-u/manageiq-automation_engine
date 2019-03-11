module MiqAeMethodService
  class MiqAeServiceCloudTenant < MiqAeServiceModelBase
    expose :ext_management_system, :association => true
    expose :security_groups,       :association => true
    expose :cloud_networks,        :association => true
    expose :vms,                   :association => true
    expose :vms_and_templates,     :association => true
    expose :miq_templates,         :association => true
    expose :floating_ips,          :association => true
    expose :cloud_resource_quotas, :association => true

    expose :update_cloud_tenant
    expose :delete_cloud_tenant
  end

  def remote_console_url=(url)
    object_send(:remote_console_url=, url, DRb.front.workspace.ae_user.id)
  end
end
