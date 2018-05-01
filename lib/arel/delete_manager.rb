# frozen_string_literal: true
module Arel
  class DeleteManager < Arel::TreeManager
    attr_accessor :returnings

    def initialize
      super
      @ast = Nodes::DeleteStatement.new
      @ctx = @ast
    end

    def from relation
      @ast.relation = relation
      self
    end

    def take limit
      @ast.limit = Nodes::Limit.new(Nodes.build_quoted(limit)) if limit
      self
    end

    def wheres= list
      @ast.wheres = list
    end

    def returning returnings
      @ast.returnings = Nodes::Returning.new(returnings) if returnings
      self
    end

  end
end
