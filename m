Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id E45574392B
	for <lists+nbd@lfdr.de>; Thu, 13 Jun 2019 17:12:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id CDF5D20433; Thu, 13 Jun 2019 15:12:08 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Jun 13 15:12:08 2019
Old-Return-Path: <josef@toxicpanda.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VERIFIED,FOURLA,MD5_SHA1_SUM,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_NONE autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 546D220388
	for <lists-other-nbd@bendel.debian.org>; Thu, 13 Jun 2019 14:55:46 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.88 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, FOURLA=0.1, MD5_SHA1_SUM=-1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id XHIMGBYuBHwC for <lists-other-nbd@bendel.debian.org>;
	Thu, 13 Jun 2019 14:55:42 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .toxicpanda. - helo: .mail-qk1-x741.google. - helo-domain: .google.)  FROM/MX_MATCHES_NOT_HELO(DOMAIN)=0; rate: -3.5
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com [IPv6:2607:f8b0:4864:20::741])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id E4F482037D
	for <nbd@other.debian.org>; Thu, 13 Jun 2019 14:55:41 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id l128so12927408qke.2
        for <nbd@other.debian.org>; Thu, 13 Jun 2019 07:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=syRsM5x5t36T0uwBQ8w3WtlVORO0dY2X14fOyDlfmP4=;
        b=MW29uUt3jByNSY9EdjIpGnBKSihl9HASLR+/ooJTV2ZJHETpBMlzK4M/8DVRozclGw
         qI7jOYKnXbNco1i2jnu7jmHoEfvTNvCUFClQyrHEPDqCbosgl7YIZBBZ4vXEhgTljPIY
         0Dlm6d90sHKdN6FETsRaV3IKYSAf2RT31FEXpzCgcw+y/DjEU1WFd6x468IKtWYaPO8R
         2YwfQJ3pvmC2AkBTSNwSkBpurq4xsKkXzFn8sN3RjOx2JNLAsHUfTigkazfpHHg6HrzE
         gpKP1GXUcLCaX6Bt6MuT7XDxJw0hZ4no5tVThuZ3BPlKt82LNfbzNwu0LDHQnKHktq59
         yHbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=syRsM5x5t36T0uwBQ8w3WtlVORO0dY2X14fOyDlfmP4=;
        b=sF+3JLc4KEtVf4na26Zp9Zf2olHUs7XY5Q5dpPnnP86TR9SHunFdF0rakmFI8Bz5gX
         E9iz5nCdhxnvnRt26s3YL89L2U0jBdAKJ7qORlpugoKvb5bjRzEb0W5qhb6fan6LVp98
         3B0i7UaczA2tl0eDDRmP78X95qNfK2XBSrqsBCIq0/NuHszd64SoLnMyH31v3Zpir6uU
         tTcrHhoc1iX6h7s/r1Z3BWkWKzs06gp55pvxwh3V3aBY0E/JeYlZTbhGyDFRk16bn7Ja
         UGuPFYtSUABx8rJi6CObBP2zD36UKcZ/fXIiRnwFagGJln5OCNfA7PH/RDhBTv4s5dqX
         /J0A==
X-Gm-Message-State: APjAAAVB8Q8TGJMZgC52MsUovBnBLMzq5RcZaSEql6wfKaQUOh6lFszu
	UpekUV0ojMHxCSKPiZubJa2ISQ==
X-Google-Smtp-Source: APXvYqyBEJXlITHzA9ZejAG6r56aunWdCYC9tOvEIffA6U0RZhtD9cozUHnyThUCVBCpbzxPxUSPyQ==
X-Received: by 2002:a37:9c50:: with SMTP id f77mr71923542qke.6.1560437738450;
        Thu, 13 Jun 2019 07:55:38 -0700 (PDT)
Received: from localhost ([2620:10d:c091:480::9d6b])
        by smtp.gmail.com with ESMTPSA id a15sm1981399qtb.43.2019.06.13.07.55.37
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 13 Jun 2019 07:55:37 -0700 (PDT)
Date: Thu, 13 Jun 2019 10:55:36 -0400
From: Josef Bacik <josef@toxicpanda.com>
To: Roman Stratiienko <roman.stratiienko@globallogic.com>
Cc: Josef Bacik <josef@toxicpanda.com>, linux-kernel@vger.kernel.org,
	nbd@other.debian.org,
	Aleksandr Bulyshchenko <A.Bulyshchenko@globallogic.com>,
	linux-block@vger.kernel.org, axboe@kernel.dkn.org
Subject: Re: [PATCH 2/2] nbd: add support for nbd as root device
Message-ID: <20190613145535.tdesq3y2xy6ycpw7@MacBook-Pro-91.local>
References: <20190612163144.18486-1-roman.stratiienko@globallogic.com>
 <20190612163144.18486-2-roman.stratiienko@globallogic.com>
 <20190613135241.aghcrrz7rg2au3bw@MacBook-Pro-91.local>
 <CAODwZ7v=RSsmVj5GjcvGn2dn+ejLRBHZ79x-+S9DrX4GoXuVaQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAODwZ7v=RSsmVj5GjcvGn2dn+ejLRBHZ79x-+S9DrX4GoXuVaQ@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <0izlfYFMlhJ.A.O6H.IfmAdB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/588
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20190613145535.tdesq3y2xy6ycpw7@MacBook-Pro-91.local
Resent-Date: Thu, 13 Jun 2019 15:12:08 +0000 (UTC)

On Thu, Jun 13, 2019 at 05:45:13PM +0300, Roman Stratiienko wrote:
> On Thu, Jun 13, 2019 at 4:52 PM Josef Bacik <josef@toxicpanda.com> wrote:
> >
> > On Wed, Jun 12, 2019 at 07:31:44PM +0300, roman.stratiienko@globallogic.com wrote:
> > > From: Roman Stratiienko <roman.stratiienko@globallogic.com>
> > >
> > > Adding support to nbd to use it as a root device. This code essentially
> > > provides a minimal nbd-client implementation within the kernel. It opens
> > > a socket and makes the negotiation with the server. Afterwards it passes
> > > the socket to the normal nbd-code to handle the connection.
> > >
> > > The arguments for the server are passed via kernel command line.
> > > The kernel command line has the format
> > > 'nbdroot=[<SERVER_IP>:]<SERVER_PORT>/<EXPORT_NAME>'.
> > > SERVER_IP is optional. If it is not available it will use the
> > > root_server_addr transmitted through DHCP.
> > >
> > > Based on those arguments, the connection to the server is established
> > > and is connected to the nbd0 device. The rootdevice therefore is
> > > root=/dev/nbd0.
> > >
> > > Patch was initialy posted by Markus Pargmann <mpa@pengutronix.de>
> > > and can be found at https://lore.kernel.org/patchwork/patch/532556/
> > >
> > > Change-Id: I78f7313918bf31b9dc01a74a42f0f068bede312c
> > > Signed-off-by: Roman Stratiienko <roman.stratiienko@globallogic.com>
> > > Reviewed-by: Aleksandr Bulyshchenko <A.Bulyshchenko@globallogic.com>
> >
> > Just throw nbd-client in your initramfs.  Every nbd server has it's own
> > handshake protocol, embedding one particular servers handshake protocol into the
> > kernel isn't the answer here.  Thanks,
> >
> > Josef
> 
> Hello Josef,
> 
> Let me share some of my thoughts that was the motivation for providing
> this solution::
> 
> We choose NBD as a tool to run CI tests on our platforms.
> We have a wide range of different BSP's with different kind of images
> where using NFSROOT is hard or even impossible.
> Most of these BSPs are not using initramfs and some of them are Android-based.
> 
> Taking all this into account we have to put significant efforts to
> implement and test custom initramfs and it will not cover all our
> needs.
> 
> Much easier way is to embed small client into the kernel and just
> enable configuration when needed.
> 
> I believe such solution will be very useful for wide range of kernel users.
> 
> Also, as far as I know mainline nbd-server daemon have only 2
> handshake protocols. So called OLD-STYLE and NEW-STYLE. And OLD-STYLE
> is no longer supported. So it should not be a problem, or please fix
> me if I'm wrong.
> 

I don't doubt you have a good reason to want it, I'm just not clear on why an
initramfs isn't an option?  You have this special kernel with your special
option, and you manage to get these things to boot your special kernel right?
So why is a initramfs with a tiny nbd-client binary in there not an option?

Also I mean that there are a bunch of different nbd servers out there.  We have
our own here at Facebook, qemu has one, IIRC there's a ceph one.  They all have
their own connection protocols.  The beauty of NBD is that it doesn't have to
know about that part, it just does the block device part, and I'd really rather
leave it that way.  Thanks,

Josef

