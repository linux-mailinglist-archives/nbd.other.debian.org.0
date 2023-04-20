Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id C69856E9EC6
	for <lists+nbd@lfdr.de>; Fri, 21 Apr 2023 00:27:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 90EA220F3B; Thu, 20 Apr 2023 22:27:16 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Apr 20 22:27:16 2023
Old-Return-Path: <axboe@kernel.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,MD5_SHA1_SUM,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,
	T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id C97D820DAF
	for <lists-other-nbd@bendel.debian.org>; Thu, 20 Apr 2023 22:10:26 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.98 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, MD5_SHA1_SUM=-1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id jI1rFZ_rqqr2 for <lists-other-nbd@bendel.debian.org>;
	Thu, 20 Apr 2023 22:10:23 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .kernel. - helo: .mail-pj1-x1030.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 3730620DAB
	for <nbd@other.debian.org>; Thu, 20 Apr 2023 22:10:22 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-24733b262fdso217543a91.1
        for <nbd@other.debian.org>; Thu, 20 Apr 2023 15:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20221208.gappssmtp.com; s=20221208; t=1682028619; x=1684620619;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yq8kvKP0mTJEmtb5lHkCR7d4m4oQ1PJeoKQIkottUnE=;
        b=0L/jgWqlEpn2/W+Oqrfi2bayfxyzNQCMNTnOf0wXt+Oshq+coWJFAFQhbe0mpIgLr4
         KgBRI1g80BDKfwzj2hekcoafYa6y3uZorskjP2ynS26n+IGHaTiNY2l5x9oa12HI80AZ
         1oK/eLQ2HtNICBtFelvRLfzZDKw7ejnpgbNC7eKal0mSk9RlGujptFjVsHi3geHddZVQ
         4wFkd94e8kCRSR2O8KX7tdPigYhRrzQ7xTRh0/ZVRqu9cQBNGbspLM5wtulN5Rcjinw/
         wqEwjyh4+uJcJHMieC53UJ93UQirFyiUkq6KUJGkIxneaUwuKdv3aIx1gJhddNMdd9Hx
         rgwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682028619; x=1684620619;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yq8kvKP0mTJEmtb5lHkCR7d4m4oQ1PJeoKQIkottUnE=;
        b=jlew3NyLocP+2iGY5U92UclBUfz4bgtBv4CGmHe2XHcqyhhvM/bSCeZ64g8Sr1veJ5
         ePPEu9yoGfpaypt1r21SsAZiMoj1YdrxxVdPjI0i+BYjEbGZFYTu9VtMpt1u8Iyxu6s8
         yoKiVVYwqkzlHrQDbQ0+C4wPliUO7lYf+IYzrRCi0t9knwmtmDGPkr1iuTtLoFU2RbLY
         W0IaroyDEqFz7EQ4dF5pWmXGHVUHWQxRq3R73rRQhlDvX8vNppFFY6mJNBc3uwcTNXLu
         CVz0j7T3Hhcc7Mye9h8yrIFTLPavz2zpvYjUU+5brHt0+6oUMbyb7Z7UDRxnFMN2y6/z
         +osQ==
X-Gm-Message-State: AAQBX9eaS4oGMvk06EQfxFNhkDKib8HIHq4Z39zIVpXfYEXTBZlSi0cJ
	sl3I3R+MENSYh+RzJvmy1qyTxw==
X-Google-Smtp-Source: AKy350ZhMBy5GKPZV59Ht+GzZkefxM2EyRmdhC3qSdMPg5RpTSYC/as5CqeeIR8Pc77vGTXyBXq6DQ==
X-Received: by 2002:a17:90a:1d3:b0:245:eb4c:3df8 with SMTP id 19-20020a17090a01d300b00245eb4c3df8mr2843826pjd.2.1682028619241;
        Thu, 20 Apr 2023 15:10:19 -0700 (PDT)
Received: from [127.0.0.1] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 3-20020a17090a08c300b00247bdd05fe5sm1590001pjn.29.2023.04.20.15.10.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Apr 2023 15:10:18 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: josef@toxicpanda.com, Zhong Jinghua <zhongjinghua@huawei.com>
Cc: linux-block@vger.kernel.org, nbd@other.debian.org, 
 linux-kernel@vger.kernel.org, yi.zhang@huawei.com, yukuai3@huawei.com, 
 houtao1@huawei.com, yangerkun@huawei.com
In-Reply-To: <20230206145805.2645671-1-zhongjinghua@huawei.com>
References: <20230206145805.2645671-1-zhongjinghua@huawei.com>
Subject: Re: [PATCH-next] nbd: fix incomplete validation of ioctl arg
Message-Id: <168202861821.155232.3879480866523352390.b4-ty@kernel.dk>
Date: Thu, 20 Apr 2023 16:10:18 -0600
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-00303
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <9TloQsqiVfN.A.tmE.ExbQkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2442
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/168202861821.155232.3879480866523352390.b4-ty@kernel.dk
Resent-Date: Thu, 20 Apr 2023 22:27:16 +0000 (UTC)


On Mon, 06 Feb 2023 22:58:05 +0800, Zhong Jinghua wrote:
> We tested and found an alarm caused by nbd_ioctl arg without verification.
> The UBSAN warning calltrace like below:
> 
> UBSAN: Undefined behaviour in fs/buffer.c:1709:35
> signed integer overflow:
> -9223372036854775808 - 1 cannot be represented in type 'long long int'
> CPU: 3 PID: 2523 Comm: syz-executor.0 Not tainted 4.19.90 #1
> Hardware name: linux,dummy-virt (DT)
> Call trace:
>  dump_backtrace+0x0/0x3f0 arch/arm64/kernel/time.c:78
>  show_stack+0x28/0x38 arch/arm64/kernel/traps.c:158
>  __dump_stack lib/dump_stack.c:77 [inline]
>  dump_stack+0x170/0x1dc lib/dump_stack.c:118
>  ubsan_epilogue+0x18/0xb4 lib/ubsan.c:161
>  handle_overflow+0x188/0x1dc lib/ubsan.c:192
>  __ubsan_handle_sub_overflow+0x34/0x44 lib/ubsan.c:206
>  __block_write_full_page+0x94c/0xa20 fs/buffer.c:1709
>  block_write_full_page+0x1f0/0x280 fs/buffer.c:2934
>  blkdev_writepage+0x34/0x40 fs/block_dev.c:607
>  __writepage+0x68/0xe8 mm/page-writeback.c:2305
>  write_cache_pages+0x44c/0xc70 mm/page-writeback.c:2240
>  generic_writepages+0xdc/0x148 mm/page-writeback.c:2329
>  blkdev_writepages+0x2c/0x38 fs/block_dev.c:2114
>  do_writepages+0xd4/0x250 mm/page-writeback.c:2344
> 
> [...]

Applied, thanks!

[1/1] nbd: fix incomplete validation of ioctl arg
      commit: 55793ea54d77719a071b1ccc05a05056e3b5e009

Best regards,
-- 
Jens Axboe



