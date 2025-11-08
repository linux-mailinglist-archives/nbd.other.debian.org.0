Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F766C42D81
	for <lists+nbd@lfdr.de>; Sat, 08 Nov 2025 14:57:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 2A020204DD; Sat,  8 Nov 2025 13:57:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sat Nov  8 13:57:10 2025
Old-Return-Path: <axboe@kernel.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	MD5_SHA1_SUM,RCVD_IN_DNSWL_NONE,RCVD_IN_SBL_CSS autolearn=no
	autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 02617204D1
	for <lists-other-nbd@bendel.debian.org>; Sat,  8 Nov 2025 13:40:18 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=0.335 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, MD5_SHA1_SUM=-1,
	RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id umeO4eQvoVGu for <lists-other-nbd@bendel.debian.org>;
	Sat,  8 Nov 2025 13:40:15 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .kernel. - helo: .mail-qt1-x832.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com [IPv6:2607:f8b0:4864:20::832])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "WR4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 4D355204D5
	for <nbd@other.debian.org>; Sat,  8 Nov 2025 13:40:15 +0000 (UTC)
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-4eda6c385c0so4409861cf.3
        for <nbd@other.debian.org>; Sat, 08 Nov 2025 05:40:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1762609212; x=1763214012; darn=other.debian.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ghd/ld/RtrgWoEpUX7jRCKlUQzzc8Yiprpw7/fUO0CA=;
        b=I2KJm6aqYRBb3HmZn4cYnBA+9dQ4b7ODY3vXJo8kNFL3p/gIWgpXwr8oYafG8KxVJW
         Ndzf/m4Z/Pe+tK09Wge3b20NxDp0kBhWr17A+B3hmzPIkJc160qcPeviRFMESq5ki1jO
         UKix3leZevWiuNd5jwzvifX2Zd4VpQyy+KJ6NCG8V2fXPC4MSKRkgx6n2Bypyqty1GOj
         5uG2g7/2oSbuJHCMkvkppmzQV7fmSW78faU9f6JOWc6Z54WDBZ9rNAGCt6l+elHG9/sK
         v04MZ1wFmZw9sWiZXQOP8wQd6jOCGfNHAKDxdRUV5TtLg4gW2C11oixvu8sKIqtjWY4x
         ITew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762609212; x=1763214012;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ghd/ld/RtrgWoEpUX7jRCKlUQzzc8Yiprpw7/fUO0CA=;
        b=swRzwYIhNMJZ7gfsUNyNwSZyNk7Uaen5j9rs8csasuHayVGjdeDM8fkyGvsnbA7zAV
         N22DTGsAAMPB9ewhSOrltTQ3rDH0xc0KnkS+mUjqhKygA+PaKJXSWW1n1kInq+GMf2Il
         E3U+iBiRiTGatwKcup2QwcQ/ogb3LOFATtOFv0ke3a37K6J4t/IFoIS9lyVTXS+rwRo7
         LQ+Az71tjjuF19XzWmDvcxitdJqo4UQHAwJ/9MiN8sUWNo/2d1KBY2cszTn8jl+ZS61L
         nd9gdx017iMMqLbLg0ZXutteYwQ9HcqE29j+3eYmSUldhmHzhrV+LIOm5W5CItxMc0Ip
         jdZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUsOuII7g+Cz03x6kl2SpYt0v7Zet/N4ks5YztJc5Gj143i/RXDoZ1M6B+wvEJxkH8ontw=@other.debian.org
X-Gm-Message-State: AOJu0Yzr5xODjmZ216Zcex1LMQr3ArFv1UcO84056uYcq9YUj5kVUpAx
	q6Y80YNi7P+e3xkkmQ3qO0tNIP1PRhLjLAMvqvGjNHs7IayvHVAwlQ0odx8tkv+pEwc=
X-Gm-Gg: ASbGnctnxuMsx9c78SkO0Fyr3v19XQl+dbMGpYn3AI2e0b8rFKJ7Zvbpi+TUqJbBFkd
	2UI6cn35RUNWqu1DvgKHPwx7iCDy++2uGNATeexLF91G1Yktd0Q8PiIIwM4OLSzH6MQAKVZK2Ga
	ajz1TKx/vKmAweHAI656hRLEDnGWl5eKJOf5hZTyeKF552k2F6QXWxpgfvr8JblaYFwzMj03MbF
	qsQZ1idRMMSUfsVDTI8xGYCeuvLEcPpvfrYYXsCulqmVqjVdm21dJXSfYDnarcnwiIBTS2OIz4A
	6A6m0RJ198PEYRH1Fj7L843D4k76t7K8fS1VS8Tt+gDvtY09kqiLnZWqNQfQ3ZIcOrWYFaFMpwZ
	hBrpN6WkcxDrobyhZ+VLAP20mQbHYKk5DIxZ5Sr1T8/vekDlkfe2eI4kM8IACoM1CEyCUhL2taC
	1bbdf8JZCnuIAXueBJ
X-Google-Smtp-Source: AGHT+IE7901mPN3l2lR6QHNGxnfEp8vN/UEu7mW6GuPxHqTF7pE1OXBkRGjJDXweFnxWIemAIHzkWQ==
X-Received: by 2002:a05:622a:88:b0:4ec:ef09:6b74 with SMTP id d75a77b69052e-4eda4fb0d24mr36342341cf.60.1762609211781;
        Sat, 08 Nov 2025 05:40:11 -0800 (PST)
Received: from [127.0.0.1] ([216.235.231.34])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88238b290eesm14808676d6.34.2025.11.08.05.40.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Nov 2025 05:40:10 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: josef@toxicpanda.com, xiubli@redhat.com, 
 Zheng Qixing <zhengqixing@huaweicloud.com>
Cc: linux-block@vger.kernel.org, nbd@other.debian.org, 
 linux-kernel@vger.kernel.org, yi.zhang@huawei.com, yangerkun@huawei.com, 
 houtao1@huawei.com, linan122@h-partners.com, zhengqixing@huawei.com
In-Reply-To: <20251108070202.1816004-1-zhengqixing@huaweicloud.com>
References: <20251108070202.1816004-1-zhengqixing@huaweicloud.com>
Subject: Re: [PATCH] nbd: defer config put in recv_work
Message-Id: <176260921037.52069.3327906711798432611.b4-ty@kernel.dk>
Date: Sat, 08 Nov 2025 06:40:10 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <MapdAPmeQxO.A.n5eE.2w0DpB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3467
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/176260921037.52069.3327906711798432611.b4-ty@kernel.dk
Resent-Date: Sat,  8 Nov 2025 13:57:10 +0000 (UTC)


On Sat, 08 Nov 2025 15:02:02 +0800, Zheng Qixing wrote:
> There is one uaf issue in recv_work when running NBD_CLEAR_SOCK and
> NBD_CMD_RECONFIGURE:
>   nbd_genl_connect     // conf_ref=2 (connect and recv_work A)
>   nbd_open	       // conf_ref=3
>   recv_work A done     // conf_ref=2
>   NBD_CLEAR_SOCK       // conf_ref=1
>   nbd_genl_reconfigure // conf_ref=2 (trigger recv_work B)
>   close nbd	       // conf_ref=1
>   recv_work B
>     config_put         // conf_ref=0
>     atomic_dec(&config->recv_threads); -> UAF
> 
> [...]

Applied, thanks!

[1/1] nbd: defer config put in recv_work
      commit: 9517b82d8d422d426a988b213fdd45c6b417b86d

Best regards,
-- 
Jens Axboe



