Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id B560352781C
	for <lists+nbd@lfdr.de>; Sun, 15 May 2022 16:36:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 9EAF720309; Sun, 15 May 2022 14:36:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sun May 15 14:36:09 2022
Old-Return-Path: <josef@toxicpanda.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,FOURLA,
	RCVD_IN_DNSWL_NONE,T_SCC_BODY_TEXT_LINE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 3488E202D7
	for <lists-other-nbd@bendel.debian.org>; Sun, 15 May 2022 14:18:45 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.91 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, FOURLA=0.1,
	RCVD_IN_DNSWL_NONE=-0.0001, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id DcBG_YgrPJMc for <lists-other-nbd@bendel.debian.org>;
	Sun, 15 May 2022 14:18:40 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .toxicpanda. - helo: .mail-il1-x12e.google. - helo-domain: .google.)  FROM/MX_MATCHES_NOT_HELO(DOMAIN)=0; rate: -3.5
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com [IPv6:2607:f8b0:4864:20::12e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 8F33A202CF
	for <nbd@other.debian.org>; Sun, 15 May 2022 14:18:40 +0000 (UTC)
Received: by mail-il1-x12e.google.com with SMTP id s6so4101120ilp.9
        for <nbd@other.debian.org>; Sun, 15 May 2022 07:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zwphx9wPck/NWDydkQSNjs3FWUdXMzvmbDaM8Jlp77U=;
        b=ZmAnnDA9H2j4V9dYUAsU30Uy67C/xmE4iP+514u8omU4efKrK1HXw5YORsilvGJDhy
         BABuSXc/GHC4pvlSmeY/goB9ne+T3c34nCVYwQo4eJvG7p4V+oIkIGghmEUE3eRiTxOK
         jU93BZPc9ktzWdbxB0tY+Qw46lfFrMgkL4XcwstSb+jEUWloSz2Z8nhiWfFAEdo1HYFJ
         wekYx3P94h0tED7CLJh3TDbFzncLjOpQ/otsDwKCjIdCxlskN45nz0S6wdjPMf9Hvcqi
         qXNKsUSObPZPS8rGD3wWK99bIZ1/mkJ8B/nsV0TbQDTTThkguKxpsGVcQ1dzUXq6elRV
         LhqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zwphx9wPck/NWDydkQSNjs3FWUdXMzvmbDaM8Jlp77U=;
        b=3KCTDXW3qS0zjsZtGybJiG0Wz/cgnoKpz2zivc9sJNj6vn8H+ei04iOfJyE3ZbsqYQ
         /eqWm0g9mE3r+U8uPEyFB3hUb4s2tfRYk7LlCpAAMJjzSUmZIcsb7mMXqtZKN/KsKXhx
         ldBRIipbu2L2cayF0OObbZ+agZ506OfGFyY1FHAppMoqBxIv9vl49L4KEothlUHSZVHv
         TbdS06dZfAyQcRME+3FaJs3BWBwuw4inDA1ytmH9A8B+C3LP3uwS8Yi5AVTzmU9gI+xU
         V0aUpXqLfTGjqGczyPsbDVcVgaEkQE7mOc2whB+KrwrJl3biL0fhLIJrpHiqC4zPgdBQ
         V+tQ==
X-Gm-Message-State: AOAM5309634QJqwlvQc+FVgkuB7uGQlENIZVg46xLdn51ax8Mu6nExdf
	hhGP4CDBbZrar6Q8HkLxMFjMXRl7J4SZXMoBCJQKUw==
X-Google-Smtp-Source: ABdhPJxN3hka7ZtE/3qhzeZq7hHbIfuFb+85A4AFy1z7NNMomt8YTAPVNcb7EojVa82ptQIu8hhpKdaWJOux2YZroLY=
X-Received: by 2002:a92:ca0d:0:b0:2cf:3bb8:f1a5 with SMTP id
 j13-20020a92ca0d000000b002cf3bb8f1a5mr7098836ils.152.1652624316810; Sun, 15
 May 2022 07:18:36 -0700 (PDT)
MIME-Version: 1.0
References: <87o80awgq4.fsf@vostro.rath.org> <4295e767-2f3a-476e-b4c5-99814f879b9c@www.fastmail.com>
In-Reply-To: <4295e767-2f3a-476e-b4c5-99814f879b9c@www.fastmail.com>
From: Josef Bacik <josef@toxicpanda.com>
Date: Sun, 15 May 2022 10:18:26 -0400
Message-ID: <CAEzrpqfEp9Kt7HhH3_PGES8-v663uEaVWGAdT+m4JVMYN0CBsA@mail.gmail.com>
Subject: Re: How to safely disconnect NBD device
To: Nikolaus Rath <Nikolaus@rath.org>
Cc: linux-block <linux-block@vger.kernel.org>, nbd <nbd@other.debian.org>
Content-Type: text/plain; charset="UTF-8"
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <4hhkKJWCtnB.A.ZYB.Z_QgiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2069
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CAEzrpqfEp9Kt7HhH3_PGES8-v663uEaVWGAdT+m4JVMYN0CBsA@mail.gmail.com
Resent-Date: Sun, 15 May 2022 14:36:09 +0000 (UTC)

On Sun, May 15, 2022 at 7:36 AM Nikolaus Rath <Nikolaus@rath.org> wrote:
>
> Hi Josef,
>
> Would you be able to help with the question below?
>
> If I understand linux/MAINTAINERS correctly, then you're currently taking core of the NBD kernel-code?
>
> Best,
> -Nikolaus
>
> On Fri, 6 May 2022, at 21:25, Nikolaus Rath wrote:
> > $ nbd-client localhost /dev/nbd1 && mkfs.ext4 /dev/nbd1 && nbd-client -d
> > /dev/nbd1
> >
> > Frequently gives me errors like this:
> >
> > May 02 15:20:50 vostro.rath.org kernel: nbd1: detected capacity change
> > from 0 to 52428800
> > May 02 15:20:50 vostro.rath.org kernel: block nbd1: NBD_DISCONNECT
> > May 02 15:20:50 vostro.rath.org kernel: block nbd1: Disconnected due to
> > user request.
> > May 02 15:20:50 vostro.rath.org kernel: block nbd1: shutting down
> > sockets
> > May 02 15:20:50 vostro.rath.org kernel: I/O error, dev nbd1, sector 776
> > op 0x0:(READ) flags 0x80700 phys_seg 29 prio class 0
> > May 02 15:20:50 vostro.rath.org kernel: I/O error, dev nbd1, sector 776
> > op 0x0:(READ) flags 0x0 phys_seg 1 prio class 0
> > May 02 15:20:50 vostro.rath.org kernel: Buffer I/O error on dev nbd1,
> > logical block 97, async page read
> > May 02 15:20:50 vostro.rath.org kernel: block nbd1: Attempted send on
> > invalid socket
> > May 02 15:20:50 vostro.rath.org kernel: I/O error, dev nbd1, sector 0
> > op 0x1:(WRITE) flags 0x800 phys_seg 0 prio class 0
> > May 02 15:20:50 vostro.rath.org kernel: block nbd1: Attempted send on
> > invalid socket
> > May 02 15:20:50 vostro.rath.org kernel: I/O error, dev nbd1, sector 0
> > op 0x1:(WRITE) flags 0x800 phys_seg 0 prio class 0
> >
> > To me, this looks as if the kernel is shutting down the NBD connection
> > while there are still active requests and/or while there is still dirty
> > data that needs to be flushed.
> >
> > Is this expected behavior?
> >
> > If so, what is the recommended way to *safely* disconnect an NBD device?
>

Normally this happens because systemd/udev have rules to go and
trigger a scan of devices when they are closed after being opened with
O_EXCL.  mkfs.ext4 should be doing the correct thing and fsync()'ing,
so all of it's stuff should be flushed. the WRITE's are disconcerting,
I'd expect the READ's for sure.  I'd recommend pulling out bpftrace or
something similar to figure out who is issuing WRITE's after the mkfs.

Unfortunately there's nothing for NBD to do here, there's no way for
it to predict what requests may come in.  It should be waiting for all
outstanding requests, but new requests coming in will just get EIO.
Thanks,

Josef

