module MiqAeServiceManageIQ_Providers_Redhat_InfraManager_VmSpec
  describe MiqAeMethodService::MiqAeServiceManageIQ_Providers_Redhat_InfraManager_Vm do
    let(:vm)         { FactoryGirl.create(:vm_redhat) }
    let(:service_vm) { MiqAeMethodService::MiqAeServiceManageIQ_Providers_Redhat_InfraManager_Vm.find(vm.id) }

    before do
      allow(MiqServer).to receive(:my_zone).and_return('default')
      @base_queue_options = {
        :class_name  => vm.class.name,
        :instance_id => vm.id,
        :zone        => 'default',
        :role        => 'ems_operations',
        :task_id     => nil
      }
    end

    it "#set_number_of_cpus" do
      service_vm.set_number_of_cpus(1)

      expect(MiqQueue.first).to have_attributes(
        @base_queue_options.merge(
          :method_name => 'set_number_of_cpus',
          :args        => [1])
      )
    end

    it "#set_memory" do
      service_vm.set_memory(100)

      expect(MiqQueue.first).to have_attributes(
        @base_queue_options.merge(
          :method_name => 'set_memory',
          :args        => [100])
      )
    end

    it "#add_disk" do
      service_vm.add_disk('disk_1', 100, :interface => "IDE", :bootable => true)

      expect(MiqQueue.first).to have_attributes(
        @base_queue_options.merge(
          :method_name => 'add_disk',
          :args        => ['disk_1', 100, {:interface => "IDE", :bootable => true}])
      )
    end
  end
end
