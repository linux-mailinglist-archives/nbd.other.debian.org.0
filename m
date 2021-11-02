Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DEB644344B
	for <lists+nbd@lfdr.de>; Tue,  2 Nov 2021 18:06:32 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 14935204D0; Tue,  2 Nov 2021 17:06:32 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Nov  2 17:06:32 2021
Old-Return-Path: <axboe@kernel.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,MD5_SHA1_SUM,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE
	autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 71C98204E4
	for <lists-other-nbd@bendel.debian.org>; Tue,  2 Nov 2021 16:50:56 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.98 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, MD5_SHA1_SUM=-1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id e9o49ZLFsU1T for <lists-other-nbd@bendel.debian.org>;
	Tue,  2 Nov 2021 16:50:51 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .kernel. - helo: .mail-io1-xd36.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com [IPv6:2607:f8b0:4864:20::d36])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 79460204DA
	for <nbd@other.debian.org>; Tue,  2 Nov 2021 16:50:51 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id b203so11052727iof.1
        for <nbd@other.debian.org>; Tue, 02 Nov 2021 09:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:in-reply-to:references:subject:message-id:date
         :mime-version:content-transfer-encoding;
        bh=+dbQrmv/b1RygKbYKHH/vVKFe1UJLRUyNsf2ThtHMLg=;
        b=yYUlBfR+AahwtMsc9t/bT1wxlAjiqYn6KCVtPJwRowvsrx3AKmWyImkeE9GwPnjJ/g
         9r8CWW3DzzktOW7KdJ+OlIqgqGDN1GfijyeI05jbdMtmJF193edHIUXQLSK9qrKKIyXc
         T3JJONJyx5Ui4jL4+9JYAlXgszMrv5YS53243mpOSaHZW+vpWNY/DKFeFrNLfikhUSAs
         TqLnNYfmmG1kaL5GvME/9tzK12cAe65XdZwEZwJPsuySH6PEDukX5HldaRI3zrpv09JU
         MVKABNXst6dfW9eTPFe4MtfuaE+J6UIZH1IgVyzy7sBLEs2j6IvB4JJcqYqTePNI7bKG
         7Sjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject
         :message-id:date:mime-version:content-transfer-encoding;
        bh=+dbQrmv/b1RygKbYKHH/vVKFe1UJLRUyNsf2ThtHMLg=;
        b=LSFR1iYgCYdDDT+TQc4GS9E4sccWDx5e1ajSbQll7FR4EJ6WV6wpZSLweBM/kFICLs
         3+mf2JZLRJgGpsFqRcuVCWKjjPs7dQG7acJZgaXeJz1hlvUpZIvoP/9rGyTg2PD3IkYB
         Vzhk2KeAZ+qMc/oye8IApXr6s9JRhQbaNe8s5R4asPMf3PEwognsyMsd2XrSPojaViIK
         VnPS7Yr4fZRqLKbNruydyRkh68IqLS0ab8XwD8fgTu63T0q/Lcx8yD5Iy2ui9xKuLU11
         4lWSwRpkO3+S3EOzxUtumQ0hOOse6GQ0S5iGLlxSjuC9obtgo57CLEN5El57hROwmeps
         RHVg==
X-Gm-Message-State: AOAM533r09ZhG3OGDMt/SOsklUgWd1Cs/d/eYX072XGt06Pyxf1ghSG5
	Ze5McAWEwhAY7MVY5BjDjDC7mA==
X-Google-Smtp-Source: ABdhPJx6UgcW+UNHqi1soE/BIyhBzdbWrSlvz2f+AJjxo6tGbxRgXfr43Pew7zrdEGjiWWyR9zQoKw==
X-Received: by 2002:a05:6638:a2d:: with SMTP id 13mr28494972jao.12.1635871847575;
        Tue, 02 Nov 2021 09:50:47 -0700 (PDT)
Received: from [127.0.1.1] ([207.135.234.126])
        by smtp.gmail.com with ESMTPSA id g17sm4870213iow.20.2021.11.02.09.50.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Nov 2021 09:50:47 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: nbd@other.debian.org, linux-block@vger.kernel.org, Ye Bin <yebin10@huawei.com>, josef@toxicpanda.com
Cc: linux-kernel@vger.kernel.org
In-Reply-To: <20211102015237.2309763-1-yebin10@huawei.com>
References: <20211102015237.2309763-1-yebin10@huawei.com>
Subject: Re: [PATCH -next v4 0/4] Fix hungtask when nbd_config_put and sanity check for first_minor
Message-Id: <163587184699.364332.2099486260392695081.b4-ty@kernel.dk>
Date: Tue, 02 Nov 2021 10:50:46 -0600
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <PeB5axeE_iG.A.d6B.YAXghB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1606
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/163587184699.364332.2099486260392695081.b4-ty@kernel.dk
Resent-Date: Tue,  2 Nov 2021 17:06:32 +0000 (UTC)

On Tue, 2 Nov 2021 09:52:33 +0800, Ye Bin wrote:
> This patchset include two patchsets as follows:
> 1. Fix hungtask when nbd_config_put
> https://patchwork.kernel.org/project/linux-block/list/?series=573381
> 2. nbd: fix sanity check for first_minor
> https://lore.kernel.org/linux-block/20211021122936.758221-1-yukuai3@huawei.com/
> 
> I have consulted with Yu Kuai, and his modification has also been confirmed by him.
> 
> [...]

Applied, thanks!

[1/4] nbd: fix max value for 'first_minor'
      commit: e4c4871a73944353ea23e319de27ef73ce546623
[2/4] nbd: fix possible overflow for 'first_minor' in nbd_dev_add()
      commit: 940c264984fd1457918393c49674f6b39ee16506
[3/4] nbd: Fix incorrect error handle when first_minor is illegal in nbd_dev_add
      commit: 69beb62ff0d1723a750eebe1c4d01da573d7cd19
[4/4] nbd: Fix hungtask when nbd_config_put
      commit: e2daec488c57069a4a431d5b752f50294c4bf273

Best regards,
-- 
Jens Axboe


