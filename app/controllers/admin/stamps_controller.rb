class Admin::StampsController < AdminsController

  def create
    stamp = Stamps.create!(
        :tracking_number => true,
        :rate          => rates.first,
        :to            => standardized_address,
        :from => {
            :full_name   => 'New Startup',
            :address1    => 'Fake Street',
            :address2    => '9th FL',
            :city        => 'Manhattan',
            :state       => 'NY',
            :zip_code    => '11220'
        },
        :memo => 'Thanks for shopping with us!'
    )
    redirect_to admin_shipping_path
  end

end