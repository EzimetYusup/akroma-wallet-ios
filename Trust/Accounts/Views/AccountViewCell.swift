// Copyright SIX DAY LLC. All rights reserved.

import TrustKeystore
import UIKit

protocol AccountViewCellDelegate: class {
    func accountViewCell(_ cell: AccountViewCell, didTapInfoViewForAccount _: Wallet)
}

class AccountViewCell: UITableViewCell {

    static let identifier = "AccountViewCell"

    weak var delegate: AccountViewCellDelegate?

    let walletImageView = UIImageView()
    let walletLabel = UILabel()
    let nickNameLabel = UILabel()
    let infoButton = UIButton(type: .infoLight)

    var viewModel: AccountViewModel? {
        didSet {
            walletImageView.image = viewModel?.image
            walletLabel.text = viewModel?.title
            nickNameLabel.text = viewModel?.wallet.nickName
        }
    }

    private struct Layout {
        static let nickNameMinWidth: CGFloat = 60
        static let activeSize: CGFloat = 8
        static let infoButtonWidth: CGFloat = 22
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        walletImageView.translatesAutoresizingMaskIntoConstraints = false
        walletImageView.layer.cornerRadius = Layout.activeSize / 2
        walletImageView.layer.masksToBounds = true

        walletLabel.translatesAutoresizingMaskIntoConstraints = false
        walletLabel.lineBreakMode = .byTruncatingMiddle

        nickNameLabel.translatesAutoresizingMaskIntoConstraints = false
        nickNameLabel.font = UIFont.systemFont(ofSize: 14)

        infoButton.translatesAutoresizingMaskIntoConstraints = false
        infoButton.tintColor = Colors.blue
        infoButton.addTarget(self, action: #selector(AccountViewCell.didTapInfoButton(sender:)), for: .touchUpInside)

        contentView.addSubview(nickNameLabel)
        contentView.addSubview(walletImageView)
        contentView.addSubview(walletLabel)
        contentView.addSubview(infoButton)

        NSLayoutConstraint.activate([
            walletImageView.widthAnchor.constraint(equalToConstant: Layout.activeSize),
            walletImageView.heightAnchor.constraint(equalToConstant: Layout.activeSize),
            walletImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            walletImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: StyleLayout.sideMargin),

            nickNameLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            nickNameLabel.leadingAnchor.constraint(equalTo: walletImageView.trailingAnchor, constant: StyleLayout.sideMargin),
            nickNameLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: Layout.nickNameMinWidth),

            walletLabel.trailingAnchor.constraint(equalTo: infoButton.leadingAnchor, constant: -StyleLayout.sideMargin),
            walletLabel.leadingAnchor.constraint(equalTo: nickNameLabel.trailingAnchor, constant: StyleLayout.sideMargin),
            walletLabel.topAnchor.constraint(equalTo: topAnchor),
            walletLabel.bottomAnchor.constraint(equalTo: bottomAnchor),

            infoButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            infoButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -StyleLayout.sideMargin),
            infoButton.widthAnchor.constraint(equalToConstant: Layout.infoButtonWidth),
        ])
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        self.viewModel = nil
    }

    @objc private func didTapInfoButton(sender: UIButton) {
        guard let account = viewModel?.wallet else {
            return
        }
        delegate?.accountViewCell(self, didTapInfoViewForAccount: account)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
