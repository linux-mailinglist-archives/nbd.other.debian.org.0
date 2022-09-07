Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 91B5D5B0BBA
	for <lists+nbd@lfdr.de>; Wed,  7 Sep 2022 19:45:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 5C637202FC; Wed,  7 Sep 2022 17:45:31 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Sep  7 17:45:31 2022
Old-Return-Path: <josef@toxicpanda.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,MD5_SHA1_SUM,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,
	T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 9584520345
	for <lists-other-nbd@bendel.debian.org>; Wed,  7 Sep 2022 17:27:49 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.99 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, MD5_SHA1_SUM=-1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id CVGkikPQWbpQ for <lists-other-nbd@bendel.debian.org>;
	Wed,  7 Sep 2022 17:27:40 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .toxicpanda. - helo: .mail-qk1-x72b.google. - helo-domain: .google.)  FROM/MX_MATCHES_NOT_HELO(DOMAIN)=0; rate: -3.5
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com [IPv6:2607:f8b0:4864:20::72b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 0716220341
	for <nbd@other.debian.org>; Wed,  7 Sep 2022 17:27:36 +0000 (UTC)
Received: by mail-qk1-x72b.google.com with SMTP id s22so11022279qkj.3
        for <nbd@other.debian.org>; Wed, 07 Sep 2022 10:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda-com.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=sOJSFaykwA71BM98SyYsFLb6fIMi8ySU+zYqTYP9bc4=;
        b=lN8CxxKRIuPWjEOgSoZDvX6twhOYfL3Ethh3d6ax4lwlse73go5Cw5kUAxPRZ5EHc6
         o5+7VylM43zMPXYIkijSH5ew6ssQ/yLKhWFU8fl/WwkW/RiCtsI69TJznTs5U4aCV78L
         InhhnnupX/mZOKVEcsBBFXLxfy/BNtXcMr+cvM3j2+MrxY6WsvWnrlOJbTpkjTIzutt7
         VhVQj4sLhWbs4Z/7haL7TyhFBLilcPMku892+BkzblD4hbgt47OTujp7oMSIhF2XCGhk
         zTzddwz/KbRAHpOaiA0f3Vo2w8LoiAkXKUCIQ9ZmzYx4CsMUdnuylkcVaxQSnUswzv6m
         r7zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=sOJSFaykwA71BM98SyYsFLb6fIMi8ySU+zYqTYP9bc4=;
        b=4xnoBqw1nPfQyv7A7cNj2zaCAg1z4G5g7s5tAYTiUS2rxUwYVuNLwmDvmu9IbX7ODi
         eu3ss5ckijioW4dEwcJD9wTdsQoGQEmA1fXC6dEaocq1e+QzZp8V97drbiSWyDaIxb6+
         hiimc+0vtFmaH2GLhVXof6sjEqhXh09Q2Sh8HSNN9HfoAfuDTrIk40DNOiWKNbV67szR
         2NXQVgcemHL9z4RjxNR/a7Sb8TcsIFdPsXT1hHRHXs8p21GwqMlnUxjw0OJCk4WAK12n
         hcidNvHZf1Xr+td73Wcg6LXVqO4tmEnY20xoP65qpDfrlMeJyutg0YCeSrlO+3nNgJ7y
         r0cw==
X-Gm-Message-State: ACgBeo2u/8YptigxJRqOv+RdyYI3OPqK5c/cLe3fYdxV7xfErMwzcKxO
	cY+tBNioYRZ1sK0Fdumx8SUCxA==
X-Google-Smtp-Source: AA6agR4+oBzuazP2mneC5bji7XTtzimB5QvY91JcE6Zp0ly/g79PWWAzf5vSEBI6QH793GlX1IP5Gg==
X-Received: by 2002:ae9:e519:0:b0:6bc:475:abd4 with SMTP id w25-20020ae9e519000000b006bc0475abd4mr3475473qkf.310.1662571652857;
        Wed, 07 Sep 2022 10:27:32 -0700 (PDT)
Received: from localhost (cpe-174-109-172-136.nc.res.rr.com. [174.109.172.136])
        by smtp.gmail.com with ESMTPSA id gb3-20020a05622a598300b00359961365f1sm1647235qtb.68.2022.09.07.10.27.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Sep 2022 10:27:32 -0700 (PDT)
Date: Wed, 7 Sep 2022 13:27:25 -0400
From: Josef Bacik <josef@toxicpanda.com>
To: Shigeru Yoshida <syoshida@redhat.com>
Cc: axboe@kernel.dk, linux-block@vger.kernel.org, nbd@other.debian.org,
	linux-kernel@vger.kernel.org,
	syzbot+38e6c55d4969a14c1534@syzkaller.appspotmail.com
Subject: Re: [PATCH] nbd: Fix hung when signal interrupts
 nbd_start_device_ioctl()
Message-ID: <YxjUfQUc66B+N1e7@localhost.localdomain>
References: <20220907163502.577561-1-syoshida@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220907163502.577561-1-syoshida@redhat.com>
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <8Iqy9QDJ85E.A.ArE.7iNGjB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2217
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/YxjUfQUc66B+N1e7@localhost.localdomain
Resent-Date: Wed,  7 Sep 2022 17:45:31 +0000 (UTC)

On Thu, Sep 08, 2022 at 01:35:02AM +0900, Shigeru Yoshida wrote:
> syzbot reported hung task [1].  The following program is a simplified
> version of the reproducer:
> 
> int main(void)
> {
> 	int sv[2], fd;
> 
> 	if (socketpair(AF_UNIX, SOCK_STREAM, 0, sv) < 0)
> 		return 1;
> 	if ((fd = open("/dev/nbd0", 0)) < 0)
> 		return 1;
> 	if (ioctl(fd, NBD_SET_SIZE_BLOCKS, 0x81) < 0)
> 		return 1;
> 	if (ioctl(fd, NBD_SET_SOCK, sv[0]) < 0)
> 		return 1;
> 	if (ioctl(fd, NBD_DO_IT) < 0)
> 		return 1;
> 	return 0;
> }
> 
> When signal interrupt nbd_start_device_ioctl() waiting the condition
> atomic_read(&config->recv_threads) == 0, the task can hung because it
> waits the completion of the inflight IOs.
> 
> This patch fixes the issue by clearing queue, not just shutdown, when
> signal interrupt nbd_start_device_ioctl().
> 
> Link: https://syzkaller.appspot.com/bug?id=7d89a3ffacd2b83fdd39549bc4d8e0a89ef21239 [1]
> Reported-by: syzbot+38e6c55d4969a14c1534@syzkaller.appspotmail.com
> Signed-off-by: Shigeru Yoshida <syoshida@redhat.com>

Reviewed-by: Josef Bacik <josef@toxicpanda.com>

Thanks,

Josef

