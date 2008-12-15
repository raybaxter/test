require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ChemicalsController do

  def mock_chemical(stubs={})
    @mock_chemical ||= mock_model(Chemical, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all chemicals as @chemicals" do
      Chemical.should_receive(:find).with(:all, {:include=>:vendor}).and_return([mock_chemical])
      get :index
      assigns[:chemicals].should == [mock_chemical]
    end
    
  end

  describe "responding to GET show" do

    it "should expose the requested chemical as @chemical" do
      Chemical.should_receive(:find).with("37", {:include=>:vendor}).and_return(mock_chemical)
      get :show, :id => "37"
      assigns[:chemical].should equal(mock_chemical)
    end
        
  end

  describe "responding to GET new" do
  
    it "should expose a new chemical as @chemical" do
      Chemical.should_receive(:new).and_return(mock_chemical)
      get :new
      assigns[:chemical].should equal(mock_chemical)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested chemical as @chemical" do
      Chemical.should_receive(:find).with("37").and_return(mock_chemical)
      get :edit, :id => "37"
      assigns[:chemical].should equal(mock_chemical)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created chemical as @chemical" do
        Chemical.should_receive(:new).with({'these' => 'params'}).and_return(mock_chemical(:save => true))
        post :create, :chemical => {:these => 'params'}
        assigns(:chemical).should equal(mock_chemical)
      end

      it "should redirect to the created chemical" do
        Chemical.stub!(:new).and_return(mock_chemical(:save => true))
        post :create, :chemical => {}
        response.should redirect_to(chemical_url(mock_chemical))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved chemical as @chemical" do
        Chemical.stub!(:new).with({'these' => 'params'}).and_return(mock_chemical(:save => false))
        post :create, :chemical => {:these => 'params'}
        assigns(:chemical).should equal(mock_chemical)
      end

      it "should re-render the 'new' template" do
        Chemical.stub!(:new).and_return(mock_chemical(:save => false))
        post :create, :chemical => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested chemical" do
        Chemical.should_receive(:find).with("37", :include=>:vendor).and_return(mock_chemical)
        mock_chemical.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :chemical => {:these => 'params'}
      end

      it "should expose the requested chemical as @chemical" do
        Chemical.stub!(:find).and_return(mock_chemical(:update_attributes => true))
        put :update, :id => "1"
        assigns(:chemical).should equal(mock_chemical)
      end

      it "should redirect to the chemical" do
        Chemical.stub!(:find).and_return(mock_chemical(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(chemical_url(mock_chemical))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested chemical" do
        Chemical.should_receive(:find).with("37", :include=>:vendor).and_return(mock_chemical)
        mock_chemical.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :chemical => {:these => 'params'}
      end

      it "should expose the chemical as @chemical" do
        Chemical.stub!(:find).and_return(mock_chemical(:update_attributes => false))
        put :update, :id => "1"
        assigns(:chemical).should equal(mock_chemical)
      end

      it "should re-render the 'edit' template" do
        Chemical.stub!(:find).and_return(mock_chemical(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested chemical" do
      Chemical.should_receive(:find).with("37").and_return(mock_chemical)
      mock_chemical.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the chemicals list" do
      Chemical.stub!(:find).and_return(mock_chemical(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(chemicals_url)
    end

  end

end
