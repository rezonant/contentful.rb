class ResourceStore 
    attr_reader :includes, :resource_map

    def initialize(reuse_resources = false, includes = [], resource_map = {})
        @includes = includes 
        @resource_map = resource_map 
        @reuse_resources = reuse_resources
    end 

    def find(json)
        return nil unless @reuse_resources
        return @resource_map[self.id_for_resource(json)]
    end 

    def store(json, object)
        return unless @reuse_resources
        @resource_map[self.id_for_resource(json)] = object
    end 

    private 

    def resource_id(json)
        "#{json['sys']['type']}:#{json['sys']['id']}"
    end 
end 