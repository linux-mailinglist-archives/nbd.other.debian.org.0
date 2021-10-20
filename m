Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC9E434D86
	for <lists+nbd@lfdr.de>; Wed, 20 Oct 2021 16:27:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 958EF2038A; Wed, 20 Oct 2021 14:27:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Oct 20 14:27:09 2021
Old-Return-Path: <axboe@kernel.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,MD5_SHA1_SUM,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE
	autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id C908A20309
	for <lists-other-nbd@bendel.debian.org>; Wed, 20 Oct 2021 14:10:25 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.98 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, MD5_SHA1_SUM=-1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id eCrF6VH5tjoj for <lists-other-nbd@bendel.debian.org>;
	Wed, 20 Oct 2021 14:10:17 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .kernel. - helo: .mail-ot1-x334.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 27698202ED
	for <nbd@other.debian.org>; Wed, 20 Oct 2021 14:10:16 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id b4-20020a9d7544000000b00552ab826e3aso6414074otl.4
        for <nbd@other.debian.org>; Wed, 20 Oct 2021 07:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eAir1TZHj8ej8jRm3+Abv46htwdqCGDBjtrmMkKXab0=;
        b=c5ZEUNl4zRWqSLWEpSMlcrYnUC87+RhEw5iBGeBar1ZCKT+3uZaYTFXYWaxm79Q6BB
         27xJyy20J0wrjB06FkT13/lhH2u7ctbY0q6+2HVQ0xP3uqHrL9D+3wHtF6cazZH8Ch7i
         CSwpuPoZO4uIgIv3A7ZS3pIgqmk5Ip4LRzaZ/syhX9WGe9No+rcg+ETC7f094cMy+Djh
         UZJmRT+lsRa7NAdzeHVSGeicw/ia+o/Km7KAhXiys/axPpJSBlYjoOKa82OttYOdLEu1
         8vEDc14JIFndIoBwFhGw75UMiWF/f1fdrfdfvW13glT9XUxgs4q+fWDKXUl5lvgdRZsZ
         /NIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eAir1TZHj8ej8jRm3+Abv46htwdqCGDBjtrmMkKXab0=;
        b=C3K3GMeCPAjhInNf8ptQm538a8Br8w9GJJt2sIzbz93s9Bsm/147cYOe0CQT5QUoAG
         8UwluDfwo9ksIVUnhW4NrNZzOXWWrHKiZ7ZK2pL6orFpgI8Fall/kx8dkUU1r1ratDfG
         wJq+Gfzaw0zkmHIaTGK1gwUkE8zq5ODT9fbxc/4HR1t75bbyNqr4R+rq5u7cTFe+8TkI
         WI400KS0sB4RqQ0bvf+5sjx5U7nwspPZ58goAJCww36Fjm8UYhyvDUX8G3XNP1XUEY9d
         aIYoudXrLtTiWgQUNu2Xh5uhyVzcP11GJXTMubhgfItKL5lO7UHSzbLhFevWuZK+5ay8
         JNLg==
X-Gm-Message-State: AOAM530qYf/qDVsfjshJYsgJkNogZfPRpKus9SwaAPI8f1yv5SLLwl7N
	Q1b/pNug5Po0o7PNl/EMCqSFkw==
X-Google-Smtp-Source: ABdhPJyAHK4/39pU4/Go6dsstvNmAydij4wEGbmfDM+OWDXqESXQa/OP1CnzWR7oBc1Q7Fnw62hNJQ==
X-Received: by 2002:a9d:19e8:: with SMTP id k95mr88305otk.284.1634739013089;
        Wed, 20 Oct 2021 07:10:13 -0700 (PDT)
Received: from p1.localdomain ([207.135.234.126])
        by smtp.gmail.com with ESMTPSA id 103sm486002otj.44.2021.10.20.07.10.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Oct 2021 07:10:12 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: josef@toxicpanda.com,
	nbd@other.debian.org,
	linux-block@vger.kernel.org,
	Ye Bin <yebin10@huawei.com>
Cc: Jens Axboe <axboe@kernel.dk>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next] nbd: Fix use-after-free in pid_show
Date: Wed, 20 Oct 2021 08:10:09 -0600
Message-Id: <163473900612.733071.518425291980291734.b4-ty@kernel.dk>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211020073959.2679255-1-yebin10@huawei.com>
References: <20211020073959.2679255-1-yebin10@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <jmUwlt8qXZM.A.2yC.9cCchB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1547
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/163473900612.733071.518425291980291734.b4-ty@kernel.dk
Resent-Date: Wed, 20 Oct 2021 14:27:09 +0000 (UTC)

On Wed, 20 Oct 2021 15:39:59 +0800, Ye Bin wrote:
> I got issue as follows:
> [  263.886511] BUG: KASAN: use-after-free in pid_show+0x11f/0x13f
> [  263.888359] Read of size 4 at addr ffff8880bf0648c0 by task cat/746
> [  263.890479] CPU: 0 PID: 746 Comm: cat Not tainted 4.19.90-dirty #140
> [  263.893162] Call Trace:
> [  263.893509]  dump_stack+0x108/0x15f
> [  263.893999]  print_address_description+0xa5/0x372
> [  263.894641]  kasan_report.cold+0x236/0x2a8
> [  263.895696]  __asan_report_load4_noabort+0x25/0x30
> [  263.896365]  pid_show+0x11f/0x13f
> [  263.897422]  dev_attr_show+0x48/0x90
> [  263.898361]  sysfs_kf_seq_show+0x24d/0x4b0
> [  263.899479]  kernfs_seq_show+0x14e/0x1b0
> [  263.900029]  seq_read+0x43f/0x1150
> [  263.900499]  kernfs_fop_read+0xc7/0x5a0
> [  263.903764]  vfs_read+0x113/0x350
> [  263.904231]  ksys_read+0x103/0x270
> [  263.905230]  __x64_sys_read+0x77/0xc0
> [  263.906284]  do_syscall_64+0x106/0x360
> [  263.906797]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
> 
> [...]

Applied, thanks!

[1/1] nbd: Fix use-after-free in pid_show
      commit: 0c98057be9efa32de78dbc4685fc73da9d71faa1

Best regards,
-- 
Jens Axboe


