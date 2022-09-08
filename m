Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 331835B216F
	for <lists+nbd@lfdr.de>; Thu,  8 Sep 2022 17:00:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id AF33A20540; Thu,  8 Sep 2022 15:00:11 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Sep  8 15:00:11 2022
Old-Return-Path: <axboe@kernel.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,MD5_SHA1_SUM,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,
	T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id E82EA20516
	for <lists-other-nbd@bendel.debian.org>; Thu,  8 Sep 2022 14:42:08 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.99 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, MD5_SHA1_SUM=-1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id LhmHip28BjUN for <lists-other-nbd@bendel.debian.org>;
	Thu,  8 Sep 2022 14:42:02 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .kernel. - helo: .mail-io1-xd36.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com [IPv6:2607:f8b0:4864:20::d36])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 0F29920510
	for <nbd@other.debian.org>; Thu,  8 Sep 2022 14:41:58 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id c4so14234608iof.3
        for <nbd@other.debian.org>; Thu, 08 Sep 2022 07:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date;
        bh=eWi2LVN2gecP1iaDEZcOslHil4OGn6GfTQ/ywsJxRU4=;
        b=LKjkr2bv+FmCGfu/Wp+AD7fL5K2pMWUUr/vV1s25dbXJVUx4TqzGAbIbs3U+FdZr63
         EEMPNe4U/xW3wZjBLydVXb7nPwUitbFOhP21p+51luHDGlI3dTd3IkqtXQ/9ozFWmrpP
         3eCBO5dLwo0G5exrT/POHuU9YMjrmwsl9x5eaFnxTXtPsUqKdwVw7KV+suaLHEEqTaGn
         C0PCYewzgTcTwu/EhdpJ8446cqW/bEsR6CtOhbhVo10yxauhr6xdI5ifbeq4Hib/e8Wx
         UnRE75fukNUY+jS9IzTAvhetyrmOM/lsaZaa7sCrin/ytRc5yrFpcpFr/l5SsNBShxtC
         RDdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=eWi2LVN2gecP1iaDEZcOslHil4OGn6GfTQ/ywsJxRU4=;
        b=sbpq6mJvwDlFJJ6imNcFpMC+NtJs7ZfzQb/IUJfi+r/u16bhg0UeHO0UvKA4kRDNSz
         wijHUoRKJFSteWGVlqUWMSpJI8WVaKMJfG+LuxL6UHUlmHkC1AL9w+LF1Q4yn+ZWuq98
         r5h+CqmUungp+qpbjIDhWM2fmRiEl2CZzBk4jWZDXhChjmKDk29doVejTdbAQMm0EKjD
         kkkG/wtyk2HU8oPLhmN8AHjKVf44Y5yDwxk/1XIINd0DelNGJ/fmHs4p3Xjhy1k4XJ/F
         akqQOkXyx3Io6qGpmBui9zBx5STKmH6o3jmOzKwfG+dzHwnPs0XP4mJhgQJJ1wt5kd9Z
         da4A==
X-Gm-Message-State: ACgBeo3gT9v6O42F9oAKO0deh2AS4G2egBVmTaosc7tSzmufaKONv4lJ
	XCn52A6Ln+a+CElpCud+m5p79g==
X-Google-Smtp-Source: AA6agR7lYfm0H3nIDGjlRvtjZ9XMOgf94oL/eqyyJX1dmi3uEefT+PfOmLB45yRQs15z5OC/ZSTMmA==
X-Received: by 2002:a05:6638:2103:b0:346:c965:b935 with SMTP id n3-20020a056638210300b00346c965b935mr4811111jaj.205.1662648115499;
        Thu, 08 Sep 2022 07:41:55 -0700 (PDT)
Received: from [127.0.0.1] ([207.135.234.126])
        by smtp.gmail.com with ESMTPSA id k131-20020a6bba89000000b00689abadc36asm1146694iof.3.2022.09.08.07.41.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Sep 2022 07:41:54 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: josef@toxicpanda.com, Shigeru Yoshida <syoshida@redhat.com>
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, nbd@other.debian.org,
 syzbot+38e6c55d4969a14c1534@syzkaller.appspotmail.com
In-Reply-To: <20220907163502.577561-1-syoshida@redhat.com>
References: <20220907163502.577561-1-syoshida@redhat.com>
Subject: Re: [PATCH] nbd: Fix hung when signal interrupts nbd_start_device_ioctl()
Message-Id: <166264811452.472176.16885663961423246810.b4-ty@kernel.dk>
Date: Thu, 08 Sep 2022 08:41:54 -0600
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-65ba7
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <LrJEvycKdXN.A.CHC.7NgGjB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2218
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/166264811452.472176.16885663961423246810.b4-ty@kernel.dk
Resent-Date: Thu,  8 Sep 2022 15:00:11 +0000 (UTC)

On Thu, 8 Sep 2022 01:35:02 +0900, Shigeru Yoshida wrote:
> syzbot reported hung task [1].  The following program is a simplified
> version of the reproducer:
> 
> int main(void)
> {
> 	int sv[2], fd;
> 
> [...]

Applied, thanks!

[1/1] nbd: Fix hung when signal interrupts nbd_start_device_ioctl()
      commit: 1de7c3cf48fc41cd95adb12bd1ea9033a917798a

Best regards,
-- 
Jens Axboe


