class UsersDecorator
	include Rails.application.routes.url_helpers
	include ActionView::Helpers::UrlHelper

	UsersDecoratorResult = Struct.new(
		:id,
		:name,
		:email,
		:password,
		:link_to_show,
		:link_to_edit,
		:link_to_delete,
		:link_to_index,
		:activity_count
	)

	def initialize(controller_context)
		@controller_context = controller_context
	end

	def decorate_for_index(users)
		results = []

		users.each do |user|
			results << generate_decorator_result(user: user)
		end
		results
	end

	def decorate_for_show(user)
		generate_decorator_result(user: user)
	end

	private

	def generate_decorator_result(user:)
		result = UsersDecoratorResult.new
		result.id = user.id
		result.name = user.name
		result.email = user.email
		result.password = user.password
		result.link_to_index = link_to_index
		result.link_to_show = link_to_show(user)
		result.link_to_edit = link_to_edit(user)
		result.link_to_delete = link_to_delete(user)
		result.activity_count = user.activity_count

		result
	end

	def link_to_index
		@controller_context.helpers.link_to 'Back', users_path
	end

	# def link_to_new
	# 	@controller_context.helpers.link_to 'New', new_users_path
	# end

	def link_to_show(user)
		@controller_context.helpers.link_to 'Show', user_path(user.id)
	end

	def link_to_edit(user)
		@controller_context.helpers.link_to 'Edit', edit_user_path(user.id)
	end

	def link_to_delete(user)
		@controller_context.helpers.link_to 'Delete', user_path(user.id),
			method: :delete,
			data: { confirm: 'Are you sure to delete ' + user.name + '?' }
	end

end