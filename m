Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id ED1544371A
	for <lists+nbd@lfdr.de>; Thu, 13 Jun 2019 16:09:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id AF3E92041D; Thu, 13 Jun 2019 14:09:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Jun 13 14:09:09 2019
Old-Return-Path: <josef@toxicpanda.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VERIFIED,FOURLA,MD5_SHA1_SUM,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_NONE autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id BAE7F201DC
	for <lists-other-nbd@bendel.debian.org>; Thu, 13 Jun 2019 13:52:52 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.88 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, FOURLA=0.1, MD5_SHA1_SUM=-1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id OO0RlCwV6xFD for <lists-other-nbd@bendel.debian.org>;
	Thu, 13 Jun 2019 13:52:48 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .toxicpanda. - helo: .mail-qt1-x843.google. - helo-domain: .google.)  FROM/MX_MATCHES_NOT_HELO(DOMAIN)=0; rate: -3.5
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com [IPv6:2607:f8b0:4864:20::843])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 616C4203B4
	for <nbd@other.debian.org>; Thu, 13 Jun 2019 13:52:47 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id n11so20475585qtl.5
        for <nbd@other.debian.org>; Thu, 13 Jun 2019 06:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=iBdScbJdiJZd68aym6rhQHLd3tm2EOsfFy62siRg9uo=;
        b=GFEWk0imhVI/2I2j0NZKrJmyS6v/3bvPCAqzum6N/1Q5sr6yUni2cHwAxZONJbnP01
         GMKsKVylo1eVgL2f/W9h6hTULk9/sUBYxVAfbA+oETLxNJYkeDLEDf/f9wQ5X1gc4bKI
         9MLvQ9PmzOHS35R5ynuuFhrpxncsFLKb4qU3eKkn+NTbBFWpzwdEi2WyksuapDegDBoZ
         iG/BQOK9glPcpl1q8cFd5bjCewVt+gkl8RDvf0ost08/NRfLYgJQrqYpB42lD03peNeo
         W6RiBCx9pIogytuJqBNTQ/jEs20p9LKXbZBEUd+EPoq3arEESyOtCyfGd8bZjdsv4kfB
         aVxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=iBdScbJdiJZd68aym6rhQHLd3tm2EOsfFy62siRg9uo=;
        b=gEOUg0EfnSl5xF1tM6C1O8Ve7Qdiy5qcKCYkv7TtsYECG5FiEfHo3o9VZPlFHGEN/G
         MEkUUEvkoii3YsbjrP1YPRiKmeayTko+HMZe9ijf0rkYwby42jl1H/RFWFhHSTkxH37v
         2BwT6I6sOrqrINHuODcE/2BtCXlmnCZaALC6x8HPsd5IoZuJDWi2T9bXq9Xxtrch3lec
         u5SObk18itFf5x+UTma9qTuXIGHDTpVGxzp7kMNSCr1JqQPQymsA5gaxEezNNU+FDBU/
         OGqY7+UCN7E6gU0y1ERCNXhjgGwQOgceFpYmDO9lMxCTF/MGqVUe4tBpT5ymozG+49xZ
         OGsQ==
X-Gm-Message-State: APjAAAVcdYUr9bTOaLYtaF/zqtVADPxOf+rYGlMlKIdk0XbAZXTy+d1B
	a3Dl6bsK/wnf9QTBxR6IWr7YTQ==
X-Google-Smtp-Source: APXvYqzJCWd+rW5ZvwqklVd8I6KrtVVFyDv818dOj3NqIB/npUIpX6o3ODd/u8GDJLhKmzgUZ+Qe3g==
X-Received: by 2002:a0c:af36:: with SMTP id i51mr1935341qvc.128.1560433964768;
        Thu, 13 Jun 2019 06:52:44 -0700 (PDT)
Received: from localhost ([2620:10d:c091:480::9d6b])
        by smtp.gmail.com with ESMTPSA id e63sm1454584qkd.57.2019.06.13.06.52.43
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 13 Jun 2019 06:52:43 -0700 (PDT)
Date: Thu, 13 Jun 2019 09:52:42 -0400
From: Josef Bacik <josef@toxicpanda.com>
To: roman.stratiienko@globallogic.com
Cc: linux-kernel@vger.kernel.org, josef@toxicpanda.com,
	nbd@other.debian.org, A.Bulyshchenko@globallogic.com,
	linux-block@vger.kernel.org, axboe@kernel.dkn.org
Subject: Re: [PATCH 2/2] nbd: add support for nbd as root device
Message-ID: <20190613135241.aghcrrz7rg2au3bw@MacBook-Pro-91.local>
References: <20190612163144.18486-1-roman.stratiienko@globallogic.com>
 <20190612163144.18486-2-roman.stratiienko@globallogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190612163144.18486-2-roman.stratiienko@globallogic.com>
User-Agent: NeoMutt/20180716
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <cgI7JlP09TN.A.mvG.FklAdB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/586
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20190613135241.aghcrrz7rg2au3bw@MacBook-Pro-91.local
Resent-Date: Thu, 13 Jun 2019 14:09:09 +0000 (UTC)

On Wed, Jun 12, 2019 at 07:31:44PM +0300, roman.stratiienko@globallogic.com wrote:
> From: Roman Stratiienko <roman.stratiienko@globallogic.com>
> 
> Adding support to nbd to use it as a root device. This code essentially
> provides a minimal nbd-client implementation within the kernel. It opens
> a socket and makes the negotiation with the server. Afterwards it passes
> the socket to the normal nbd-code to handle the connection.
> 
> The arguments for the server are passed via kernel command line.
> The kernel command line has the format
> 'nbdroot=[<SERVER_IP>:]<SERVER_PORT>/<EXPORT_NAME>'.
> SERVER_IP is optional. If it is not available it will use the
> root_server_addr transmitted through DHCP.
> 
> Based on those arguments, the connection to the server is established
> and is connected to the nbd0 device. The rootdevice therefore is
> root=/dev/nbd0.
> 
> Patch was initialy posted by Markus Pargmann <mpa@pengutronix.de>
> and can be found at https://lore.kernel.org/patchwork/patch/532556/
> 
> Change-Id: I78f7313918bf31b9dc01a74a42f0f068bede312c
> Signed-off-by: Roman Stratiienko <roman.stratiienko@globallogic.com>
> Reviewed-by: Aleksandr Bulyshchenko <A.Bulyshchenko@globallogic.com>

Just throw nbd-client in your initramfs.  Every nbd server has it's own
handshake protocol, embedding one particular servers handshake protocol into the
kernel isn't the answer here.  Thanks,

Josef

