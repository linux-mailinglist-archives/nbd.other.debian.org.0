Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 91BB1442381
	for <lists+nbd@lfdr.de>; Mon,  1 Nov 2021 23:39:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 4D98020407; Mon,  1 Nov 2021 22:39:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Nov  1 22:39:09 2021
Old-Return-Path: <josef@toxicpanda.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 61BEE203E9
	for <lists-other-nbd@bendel.debian.org>; Mon,  1 Nov 2021 22:23:14 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.98 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id g1T_nvTiaia0 for <lists-other-nbd@bendel.debian.org>;
	Mon,  1 Nov 2021 22:23:11 +0000 (UTC)
X-policyd-weight: using cached result; rate: -3.5
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com [IPv6:2607:f8b0:4864:20::835])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 83939203CF
	for <nbd@other.debian.org>; Mon,  1 Nov 2021 22:23:11 +0000 (UTC)
Received: by mail-qt1-x835.google.com with SMTP id v29so15970539qtc.10
        for <nbd@other.debian.org>; Mon, 01 Nov 2021 15:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda-com.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=DnYnqLqd12gaQARTKVAqqyWq5HzzIA2bkgQBVsVg4s0=;
        b=gt6wFXhTP2Om3mCyDlaPZAclh5WszLcpD8FoKutfVj8kgeF1LLfIUwzLFBUYIe1Zzb
         1wZFR2yisz7vylQ/KZ2Ca9Df9MstkiyosiVMAmFpqNmIMQkvqBA+nLzzouUtMElvy+Eh
         Rbk0LDFkDyDxgzsMF1BjOwes+AihSB4ohirmWfuyQuEPhbNOYQo3ZZbJWFpSxD1bVbzT
         FS39TzcCWib50StejXPsjWz9cwjpT/8kr8xl1HOgo5uhKK4PDMfbwiLzgnBEMV/tMEiB
         61A4v1ss0uZPfPNO5JdiHRX1eLDVszL+ITaYkQuWJonGx+1xIITEZQk7hszS792brO9q
         yfaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=DnYnqLqd12gaQARTKVAqqyWq5HzzIA2bkgQBVsVg4s0=;
        b=p+EExMg/8xXcQEMFoTENCdkBSAv+QgXiyp7wX0GdBGulMFJiCQ431yqk1gtQZ2A79X
         GdkG6MnWNngl2AjlNBeQ55yHy1yrkYYHP41Lru27hPFVODg5dUSn8HGtE+sAnNnlkHyd
         cXQaNe5eEoCAbJJZfyRl8A5qtqK4Z7zDe/+41iaHIzXb0+CwwH8a9GS3Akjlsi6hqEkz
         jJaPcmm5EOtpok9mFsHUpmAGWvNyeBF4srWgy3KwaHRqh+TfxDtNpQirlxh6+W3WCgqD
         K3oPLQE4zeB87m0o/2B6wdDl40issXMvWGnehbFwE1zxM7u2hjDztSnF42pDQl2IcBhY
         E23w==
X-Gm-Message-State: AOAM5300O+zN+iwsjvTs+IKrkYB0ulCmvI97wWzykvWC9M/B69JFeL2z
	E8x+0N0DOX4B14LAOzMymQeCVg==
X-Google-Smtp-Source: ABdhPJwD/QBrvyYQQ+Lee0e7aoTE8Wb4w7Mf/o3QAWnE91gfpf4OCl5iUbc9xxSha65pB7Z2vE2heA==
X-Received: by 2002:a05:622a:105:: with SMTP id u5mr16022514qtw.163.1635805388070;
        Mon, 01 Nov 2021 15:23:08 -0700 (PDT)
Received: from localhost (cpe-174-109-172-136.nc.res.rr.com. [174.109.172.136])
        by smtp.gmail.com with ESMTPSA id h3sm2063742qkn.73.2021.11.01.15.23.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Nov 2021 15:23:07 -0700 (PDT)
Date: Mon, 1 Nov 2021 18:23:06 -0400
From: Josef Bacik <josef@toxicpanda.com>
To: Yu Kuai <yukuai3@huawei.com>
Cc: axboe@kernel.dk, linux-block@vger.kernel.org, nbd@other.debian.org,
	linux-kernel@vger.kernel.org, yi.zhang@huawei.com
Subject: Re: [PATCH] nbd: error out if socket index doesn't match in
 nbd_handle_reply()
Message-ID: <YYBoyqYaMdTWro2m@localhost.localdomain>
References: <20211101092538.1155842-1-yukuai3@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211101092538.1155842-1-yukuai3@huawei.com>
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <A3EXniV0oMK.A.NmB.NyGghB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1598
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/YYBoyqYaMdTWro2m@localhost.localdomain
Resent-Date: Mon,  1 Nov 2021 22:39:09 +0000 (UTC)

On Mon, Nov 01, 2021 at 05:25:38PM +0800, Yu Kuai wrote:
> commit fcf3d633d8e1 ("nbd: check sock index in nbd_read_stat()") just
> add error message when socket index doesn't match. Since the request
> and reply must be transmitted over the same socket, it's ok to error
> out in such situation.
> 
> Signed-off-by: Yu Kuai <yukuai3@huawei.com>

Reviewed-by: Josef Bacik <josef@toxicpanda.com>

Thanks,

Josef

