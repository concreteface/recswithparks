class ReviewMailer < ApplicationMailer
  def new_review(review)
    @review = review
    mail(
      to: review.park.user.email,
      subject: "New Review for #{review.park.name}"
    )
  end
end
