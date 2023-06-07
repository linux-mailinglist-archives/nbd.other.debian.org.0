Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 5777472625D
	for <lists+nbd@lfdr.de>; Wed,  7 Jun 2023 16:09:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 1F92220516; Wed,  7 Jun 2023 14:09:16 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Jun  7 14:09:16 2023
Old-Return-Path: <axboe@kernel.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,MD5_SHA1_SUM,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,
	T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id E06FD20507
	for <lists-other-nbd@bendel.debian.org>; Wed,  7 Jun 2023 13:52:40 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.99 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, MD5_SHA1_SUM=-1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id B5zyabB0ud-e for <lists-other-nbd@bendel.debian.org>;
	Wed,  7 Jun 2023 13:52:36 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .kernel. - helo: .mail-qt1-x82a.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com [IPv6:2607:f8b0:4864:20::82a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id ECD1720522
	for <nbd@other.debian.org>; Wed,  7 Jun 2023 13:52:35 +0000 (UTC)
Received: by mail-qt1-x82a.google.com with SMTP id d75a77b69052e-3f812691b52so8232011cf.1
        for <nbd@other.debian.org>; Wed, 07 Jun 2023 06:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20221208.gappssmtp.com; s=20221208; t=1686145952; x=1688737952;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yBCy6Zr3tLUZoNRTWAl9DUYT1FQNLXNhhe11Jl7EVJw=;
        b=0C0UEcws8800wGAcfU9YjUSxWnq5/82Hz8dLip01clh8YgJqhfQAhSdQM/bRFYglqw
         BkFRmwNIC2wT1U5h0HObDAp5lkrdBVH6bKt2dwT4ugzdDyLKpZaYxWHCwiLplJdjXZRx
         aAqyVqX1sC1t6edvZlsbs52JcQ+JKet2zKf+e80GIEbtKibc0OaHtP07v7ZcMI+FxPMy
         nv0L+vWB5lVz/+HFIvc4xU1uZ0vaRRzxQqyY3fRmeuv0LYR0o1RRBOpXwfaoDKuER1vP
         QQF9wl/mb5fvfpO2cjkf69nmiPjrwww3q0SqVu/HWYAOeznBdMG/StrXRXlLPoLuRswQ
         wd1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686145952; x=1688737952;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yBCy6Zr3tLUZoNRTWAl9DUYT1FQNLXNhhe11Jl7EVJw=;
        b=Z4AmdkhjXLZYyrMrXwB79oPGx3qtOGPYc98GzCjASnmvfFMnzT2fnQPwn1/aBHhmLN
         yh8uFr6JIcNPzZ0ss54UKMCW/fb4X5VU3C0y/3jzaEadsmZgU6PjCTNkvrksC7crzBBF
         XOWhZB9BZlY3VBVsuve8wLuk+WtHbfwM7QyxVqCFB7eDjP8+ZTa2OdC2n+l+ZT3OK1Kc
         LKdvkpOOLkml4GtEBJsyYns/eBf8sGVzj8XH9fTTdiSngw7StnaC0FR+KSWqqGndujf0
         R+TLZfnaXDeDHjhrtMMMTatc5qUM8rKJG7S/Aol+4GF6XyNlFHGYHF4IjsH0tZClwgMB
         qLvw==
X-Gm-Message-State: AC+VfDwHxn5+qKVUZo34LQVRLXD2nEkEwbE9co7uEofkmA2JoONOhkV0
	Lp1lVYw6kVmy4CoAvguCFcyeHg==
X-Google-Smtp-Source: ACHHUZ4fQ6pIyhB3M/I8i99y9dSNcWczKJKV8fRBAt/6EkdwqWBTOtLxNvG2mG7MjkYS368wiazRpw==
X-Received: by 2002:a05:6214:d8e:b0:625:88f5:7c62 with SMTP id e14-20020a0562140d8e00b0062588f57c62mr2038353qve.2.1686145951989;
        Wed, 07 Jun 2023 06:52:31 -0700 (PDT)
Received: from [127.0.0.1] ([50.234.116.5])
        by smtp.gmail.com with ESMTPSA id s5-20020a05621412c500b0062119a7a7a3sm6141611qvv.4.2023.06.07.06.52.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 06:52:31 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: josef@toxicpanda.com, Zhong Jinghua <zhongjinghua@huaweicloud.com>
Cc: linux-block@vger.kernel.org, nbd@other.debian.org, 
 linux-kernel@vger.kernel.org, zhongjinghua@huawei.com, yi.zhang@huawei.com, 
 yukuai3@huawei.com, yangerkun@huawei.com
In-Reply-To: <20230605122159.2134384-1-zhongjinghua@huaweicloud.com>
References: <20230605122159.2134384-1-zhongjinghua@huaweicloud.com>
Subject: Re: [PATCH -next] nbd: Add the maximum limit of allocated index in
 nbd_dev_add
Message-Id: <168614594988.134969.5912378237473757521.b4-ty@kernel.dk>
Date: Wed, 07 Jun 2023 07:52:29 -0600
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-c6835
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <Ub40pSEtUXM.A.HNC.M-IgkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2528
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/168614594988.134969.5912378237473757521.b4-ty@kernel.dk
Resent-Date: Wed,  7 Jun 2023 14:09:16 +0000 (UTC)


On Mon, 05 Jun 2023 20:21:59 +0800, Zhong Jinghua wrote:
> If the index allocated by idr_alloc greater than MINORMASK >> part_shift,
> the device number will overflow, resulting in failure to create a block
> device.
> 
> Fix it by imiting the size of the max allocation.
> 
> 
> [...]

Applied, thanks!

[1/1] nbd: Add the maximum limit of allocated index in nbd_dev_add
      commit: f12bc113ce904777fd6ca003b473b427782b3dde

Best regards,
-- 
Jens Axboe



