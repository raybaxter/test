require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe VendorsController do

  # def mock_vendor(stubs={})
  #    @mock_vendor ||= mock_model(Vendor, stubs)
  #  end
  #  
  #  describe "responding to GET index" do
  # 
  #    it "should expose all vendors as @vendors" do
  #      Vendor.should_receive(:find).with(:all).and_return([mock_vendor])
  #      get :index
  #      assigns[:vendors].should == [mock_vendor]
  #    end
  # 
  #    describe "with mime type of xml" do
  #  
  #      it "should render all vendors as xml" do
  #        request.env["HTTP_ACCEPT"] = "application/xml"
  #        Vendor.should_receive(:find).with(:all).and_return(vendors = mock("Array of Vendors"))
  #        vendors.should_receive(:to_xml).and_return("generated XML")
  #        get :index
  #        response.body.should == "generated XML"
  #      end
  #    
  #    end
  # 
  #  end
  # 
  #  describe "responding to GET show" do
  # 
  #    it "should expose the requested vendor as @vendor" do
  #      Vendor.should_receive(:find).with("37").and_return(mock_vendor)
  #      get :show, :id => "37"
  #      assigns[:vendor].should equal(mock_vendor)
  #    end
  #    
  #    describe "with mime type of xml" do
  # 
  #      it "should render the requested vendor as xml" do
  #        request.env["HTTP_ACCEPT"] = "application/xml"
  #        Vendor.should_receive(:find).with("37").and_return(mock_vendor)
  #        mock_vendor.should_receive(:to_xml).and_return("generated XML")
  #        get :show, :id => "37"
  #        response.body.should == "generated XML"
  #      end
  # 
  #    end
  #    
  #  end
  # 
  #  describe "responding to GET new" do
  #  
  #    it "should expose a new vendor as @vendor" do
  #      Vendor.should_receive(:new).and_return(mock_vendor)
  #      get :new
  #      assigns[:vendor].should equal(mock_vendor)
  #    end
  # 
  #  end
  # 
  #  describe "responding to GET edit" do
  #  
  #    it "should expose the requested vendor as @vendor" do
  #      Vendor.should_receive(:find).with("37").and_return(mock_vendor)
  #      get :edit, :id => "37"
  #      assigns[:vendor].should equal(mock_vendor)
  #    end
  # 
  #  end
  # 
  #  describe "responding to POST create" do
  # 
  #    describe "with valid params" do
  #      
  #      it "should expose a newly created vendor as @vendor" do
  #        Vendor.should_receive(:new).with({'these' => 'params'}).and_return(mock_vendor(:save => true))
  #        post :create, :vendor => {:these => 'params'}
  #        assigns(:vendor).should equal(mock_vendor)
  #      end
  # 
  #      it "should redirect to the created vendor" do
  #        Vendor.stub!(:new).and_return(mock_vendor(:save => true))
  #        post :create, :vendor => {}
  #        response.should redirect_to(vendor_url(mock_vendor))
  #      end
  #      
  #    end
  #    
  #    describe "with invalid params" do
  # 
  #      it "should expose a newly created but unsaved vendor as @vendor" do
  #        Vendor.stub!(:new).with({'these' => 'params'}).and_return(mock_vendor(:save => false))
  #        post :create, :vendor => {:these => 'params'}
  #        assigns(:vendor).should equal(mock_vendor)
  #      end
  # 
  #      it "should re-render the 'new' template" do
  #        Vendor.stub!(:new).and_return(mock_vendor(:save => false))
  #        post :create, :vendor => {}
  #        response.should render_template('new')
  #      end
  #      
  #    end
  #    
  #  end
  # 
  #  describe "responding to PUT udpate" do
  # 
  #    describe "with valid params" do
  # 
  #      it "should update the requested vendor" do
  #        Vendor.should_receive(:find).with("37").and_return(mock_vendor)
  #        mock_vendor.should_receive(:update_attributes).with({'these' => 'params'})
  #        put :update, :id => "37", :vendor => {:these => 'params'}
  #      end
  # 
  #      it "should expose the requested vendor as @vendor" do
  #        Vendor.stub!(:find).and_return(mock_vendor(:update_attributes => true))
  #        put :update, :id => "1"
  #        assigns(:vendor).should equal(mock_vendor)
  #      end
  # 
  #      it "should redirect to the vendor" do
  #        Vendor.stub!(:find).and_return(mock_vendor(:update_attributes => true))
  #        put :update, :id => "1"
  #        response.should redirect_to(vendor_url(mock_vendor))
  #      end
  # 
  #    end
  #    
  #    describe "with invalid params" do
  # 
  #      it "should update the requested vendor" do
  #        Vendor.should_receive(:find).with("37").and_return(mock_vendor)
  #        mock_vendor.should_receive(:update_attributes).with({'these' => 'params'})
  #        put :update, :id => "37", :vendor => {:these => 'params'}
  #      end
  # 
  #      it "should expose the vendor as @vendor" do
  #        Vendor.stub!(:find).and_return(mock_vendor(:update_attributes => false))
  #        put :update, :id => "1"
  #        assigns(:vendor).should equal(mock_vendor)
  #      end
  # 
  #      it "should re-render the 'edit' template" do
  #        Vendor.stub!(:find).and_return(mock_vendor(:update_attributes => false))
  #        put :update, :id => "1"
  #        response.should render_template('edit')
  #      end
  # 
  #    end
  # 
  #  end
  # 
  #  describe "responding to DELETE destroy" do
  # 
  #    it "should destroy the requested vendor" do
  #      Vendor.should_receive(:find).with("37").and_return(mock_vendor)
  #      mock_vendor.should_receive(:destroy)
  #      delete :destroy, :id => "37"
  #    end
  #  
  #    it "should redirect to the vendors list" do
  #      Vendor.stub!(:find).and_return(mock_vendor(:destroy => true))
  #      delete :destroy, :id => "1"
  #      response.should redirect_to(vendors_url)
  #    end
  # 
  #  end
 
end
