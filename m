Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id AC294580810
	for <lists+nbd@lfdr.de>; Tue, 26 Jul 2022 01:18:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 45664204B8; Mon, 25 Jul 2022 23:18:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Jul 25 23:18:09 2022
Old-Return-Path: <axboe@kernel.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: ***
X-Spam-Status: No, score=3.5 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,MD5_SHA1_SUM,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,
	RCVD_IN_SBL_CSS autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id C7C992047D
	for <lists-other-nbd@bendel.debian.org>; Mon, 25 Jul 2022 23:02:01 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=1.345 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, MD5_SHA1_SUM=-1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id XnxbvOlojX0y for <lists-other-nbd@bendel.debian.org>;
	Mon, 25 Jul 2022 23:01:57 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .kernel. - helo: .mail-pj1-x102d.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 1E7852047E
	for <nbd@other.debian.org>; Mon, 25 Jul 2022 23:01:56 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id t2-20020a17090a4e4200b001f21572f3a4so11625106pjl.0
        for <nbd@other.debian.org>; Mon, 25 Jul 2022 16:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:in-reply-to:references:subject:message-id:date
         :mime-version:content-transfer-encoding;
        bh=46K29R/jzyxgb2qSaTV9iMS7TQPCalfZVfhX2Tr92gY=;
        b=CIaHQMCs5XgyB1WYNkmfhOi7jd/IYdCWke0DlBatUWbzMxBkNArtPdRWi90eBcE7ZU
         0A3WCdfrALjJymKpX2+4qoQPsEBAFPScYl1wc3JX/2inncWIeim2M9vQfGq/mSMmsR4s
         4VBdu25E76ZR5QBIY56alMfW32wkuhV7upB2bR8mxKHr6Om2UIS3PXjlqPW63w/rVrgj
         ECwWTQwLuY0vRiUOYwiL5eMXB7GocuUkYUrhIVS2s6x+jKgqV5Spct4v/TMT7T11BLHs
         G2zR8WjA5GdOWE1f6z3j6uX+rfC8aILXhoEf+C5M1y48Tk/Gsod7vXBNUuaq3MNF/8aT
         Nlyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject
         :message-id:date:mime-version:content-transfer-encoding;
        bh=46K29R/jzyxgb2qSaTV9iMS7TQPCalfZVfhX2Tr92gY=;
        b=ILkIBBNjlZ4HFK8QyjPWk3a+5hsFfYxpwJI302dJe9n2nKVpEY9ZmIjVAXmjg0ualy
         vdGrCZXQgLNvKlKcnQqVcZcO9IrnhuKLm3hKNXAfxwzJZ/SW6TUMo2pdKyCz34CTV22x
         2cUsaEi71YFPJGmBs6scceso5gQ7fvxdYsLtWFP+cBEJE+VlO0UuBJOrQU4p1YvbC3Ot
         clVyHHCuT5sueEwsO8Fzfd1KGXoYOfzMA6ciu7r1wpGvuIarOvzrYFoUbFTExznVMUj+
         XCHD7YsZkw3vKJaviPjLF79fdZ/c13SuEClNyI35tXv7H/BUw34TxCJnaGOAVqbKa7iS
         NDHA==
X-Gm-Message-State: AJIora/QDPRR18qm8qB5L/AnS//w6toSN0HZKxDbGFveoMQy8OSqQRxl
	nOOkG/COTKCL+6rztNKkxCoiGA==
X-Google-Smtp-Source: AGRyM1sBYRQJfc/HWpmo8/5mg+wOFnvP9N5PLTvA5O8z4Xakspc4+PQVo+SumV5LXkcdWrBeMwfdQQ==
X-Received: by 2002:a17:902:778c:b0:16d:9d4d:51f9 with SMTP id o12-20020a170902778c00b0016d9d4d51f9mr498919pll.19.1658790113013;
        Mon, 25 Jul 2022 16:01:53 -0700 (PDT)
Received: from [127.0.1.1] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id w3-20020a170902e88300b0016d2f0b67e0sm9648333plg.309.2022.07.25.16.01.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jul 2022 16:01:52 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: houtao1@huawei.com, yukuai1@huaweicloud.com, josef@toxicpanda.com, yukuai3@huawei.com, joe@perches.com
Cc: nbd@other.debian.org, yi.zhang@huawei.com, linux-kernel@vger.kernel.org, linux-block@vger.kernel.org
In-Reply-To: <20220723082427.3890655-1-yukuai1@huaweicloud.com>
References: <20220723082427.3890655-1-yukuai1@huaweicloud.com>
Subject: Re: [PATCH v2] nbd: add missing definition of pr_fmt
Message-Id: <165879011117.1265523.8426782568331317022.b4-ty@kernel.dk>
Date: Mon, 25 Jul 2022 17:01:51 -0600
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <nQmYXspDKfM.A.zeE.xSy3iB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2206
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/165879011117.1265523.8426782568331317022.b4-ty@kernel.dk
Resent-Date: Mon, 25 Jul 2022 23:18:09 +0000 (UTC)

On Sat, 23 Jul 2022 16:24:27 +0800, Yu Kuai wrote:
> From: Yu Kuai <yukuai3@huawei.com>
> 
> commit 1243172d5894 ("nbd: use pr_err to output error message") tries
> to define pr_fmt and use short pr_err() to output error message,
> however, the definition is missed.
> 
> This patch also remove existing "nbd:" inside pr_err().
> 
> [...]

Applied, thanks!

[1/1] nbd: add missing definition of pr_fmt
      commit: b182198426ac3130f3543b1ad67855a84c4c5af2

Best regards,
-- 
Jens Axboe


