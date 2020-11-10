Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D9D2ADA2D
	for <lists+nbd@lfdr.de>; Tue, 10 Nov 2020 16:18:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 9CA2820250; Tue, 10 Nov 2020 15:18:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Nov 10 15:18:09 2020
Old-Return-Path: <axboe@kernel.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	MURPHY_DRUGS_REL8,NICE_REPLY_A,RCVD_IN_DNSWL_NONE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 32C7820214
	for <lists-other-nbd@bendel.debian.org>; Tue, 10 Nov 2020 15:01:54 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.981 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	MURPHY_DRUGS_REL8=0.02, NICE_REPLY_A=-0.001,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 2lfhhJIK36Vq for <lists-other-nbd@bendel.debian.org>;
	Tue, 10 Nov 2020 15:01:49 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .kernel. - helo: .mail-pg1-x544.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 8F19C2022F
	for <nbd@other.debian.org>; Tue, 10 Nov 2020 15:01:49 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id 62so10363615pgg.12
        for <nbd@other.debian.org>; Tue, 10 Nov 2020 07:01:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=yv0x4pKmyqoQ3NFgWKouoXjBWuY7N5DeTwdLHRsMbfM=;
        b=NfZt6Z/35bJEdyriRwGK5uqICs+0CxQHGvpSYM3Lgc6R+5p0JpIhgJYh2xuBoSX7u3
         v91SBGhKbidwlMHYyxh7pcfhGBIbZxj/YICsU7SSe3FwCLOD40+Vg0w5uKajxxxHQncP
         fmjKrtSYgiDd21F+8j5vTTuezli89Jk6YEpo3+vQWcRGYu7TW0b0yBr4g3bSAwmIM0eR
         GR28yd6yuJB04T6XI4484ptmrj7K8glvtMJfC28oh/j5xkVVyxwSIOUkOGY+jbO0A5z+
         YtU1Aw4n/U0aMJUfImoROeoVJPIoGAQBb8lLu7D/coJM6vtGgQ95Av6cf2bCfyzTNzMr
         Uyqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=yv0x4pKmyqoQ3NFgWKouoXjBWuY7N5DeTwdLHRsMbfM=;
        b=eW6rIE8kv+dGFSLFUYtA3sVY6E6UVNU6PnX5idWj8qe6xkdkXjZPByni7lfiKSypCG
         3BslnIgnXy0CmOG8kXhsORxksu/fjKB3IlWXs/AOPcQ/c+dhE3OVqKnzRtzjAlr0krqk
         0YTJHOdIgSgSQTmQE70rnSOwYlLMlQPoXxxU9Wv5uf9Wb8SsKvRNTejy5cVRfGw2bTNk
         iRkHNcjR919k701mK7n3bSjguUAYIrnHbEQkHcXP4Q41rUCjm+9urtETio1k+QK0qFLY
         h5ye0rD/qFogp3bPzV32wX01BPZlgeYENUyLFllgkjJuTUxSmg+mSDWDhqpEicmyoYKa
         wP0w==
X-Gm-Message-State: AOAM533hWJBCd+yL6SH6cOTC1azZxX5jtmfLrUW1BO6goDAqQTsZ9M6c
	5sup5XCBomoPce7tH4reRrnclNFDmx/sjw==
X-Google-Smtp-Source: ABdhPJxuY9FhzKUndO6y0cD5/gR3kLJeqwn2W95CY52lKt35Oh+eeXPQnj4xA2xeoqIRbNo1Fh14uQ==
X-Received: by 2002:a17:90a:4dc8:: with SMTP id r8mr75784pjl.1.1605020505013;
        Tue, 10 Nov 2020 07:01:45 -0800 (PST)
Received: from [192.168.1.134] ([66.219.217.173])
        by smtp.gmail.com with ESMTPSA id s22sm13304748pfu.119.2020.11.10.07.01.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2020 07:01:44 -0800 (PST)
Subject: Re: [PATCH] nbd: fix a block_device refcount leak in nbd_release
To: Christoph Hellwig <hch@lst.de>, josef@toxicpanda.com
Cc: linux-block@vger.kernel.org, nbd@other.debian.org
References: <20201109173059.2500429-1-hch@lst.de>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <b1054866-85f3-54f9-999a-07760b1237f2@kernel.dk>
Date: Tue, 10 Nov 2020 08:01:42 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201109173059.2500429-1-hch@lst.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <6mqG2_rbhjB.A.poC.x8qqfB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1052
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/b1054866-85f3-54f9-999a-07760b1237f2@kernel.dk
Resent-Date: Tue, 10 Nov 2020 15:18:09 +0000 (UTC)

On 11/9/20 10:30 AM, Christoph Hellwig wrote:
> bdget_disk needs to be paired with bdput to not leak a reference
> on the block device inode.

Applied, thanks.

-- 
Jens Axboe

