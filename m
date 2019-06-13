Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id DF92043803
	for <lists+nbd@lfdr.de>; Thu, 13 Jun 2019 17:03:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 973FD2042C; Thu, 13 Jun 2019 15:03:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Jun 13 15:03:09 2019
Old-Return-Path: <roman.stratiienko@globallogic.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,DKIM_VERIFIED,FOURLA,
	MD5_SHA1_SUM,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id A548B20433
	for <lists-other-nbd@bendel.debian.org>; Thu, 13 Jun 2019 14:45:31 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.08 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	MD5_SHA1_SUM=-1, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id UGj1ul7V3Gsw for <lists-other-nbd@bendel.debian.org>;
	Thu, 13 Jun 2019 14:45:27 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .globallogic. - helo: .mail-ed1-x541.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 80211201C3
	for <nbd@other.debian.org>; Thu, 13 Jun 2019 14:45:27 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id z25so31598647edq.9
        for <nbd@other.debian.org>; Thu, 13 Jun 2019 07:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=globallogic.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uvmsidGoJnOuVrNH93gzDhxt94b4IkyqxQH7sIQgBJY=;
        b=jWjpQvqFJpy3JZ8v3eJX/wY/JM7UzO7PqMYyaXZ3zvjJxFfOHON2tSICAV3Md/FBuR
         Y4oPZ1USj/EWpQnKcOs7XBvas6TOzv2l5znmvTTKTFx3uKVRdProUC4XDiCaAWgM/rGc
         Kk4IdyKh8ubR8hhiNJoQU8VlFscolUuaDwjyQc/O7ksT6ViPYNrMM34FNuw5ExZO7Mcu
         Erv24mDt50rY0r4Gd/JvyvqmL0Qm/Bd3QNiZXD9mjX3hTflwIfnOR/JGqFMUCA4Qb20+
         npVhj+/bkWt/M+IngqB4do4HipI95akb14e9EpKZcAxnnz7WxF0eVp4EpyGGC9XYZN4a
         YiYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uvmsidGoJnOuVrNH93gzDhxt94b4IkyqxQH7sIQgBJY=;
        b=h1kycTCU6Pmyh/bkYErshxIBcRsLLBeaRyzitAyZfk9Dr87X6nY7uRdIwSeJNdoAgk
         h6mMOmTTeUlRQXAaiKNv24wmtgigP4loD3fyM+ByfKDJCyinzbg5d0bHRqEmu0wAZAok
         1OBTCb5N+elNSFK8zeTWRNGiUwQ4tqpnJtpBvjRR8AfmAjX6G7T5SoESh54TDOfLNkO7
         dGIDR7q8K0V75VqybEo7CiJcB8fPiE9remWhOFOT52SEgIibdoMhLYfDo+VqPmf4BYi9
         9z6pQVyA3usTGP5JlgHLUM6EjMbLtkMmhfZ2rp6uiwDQDxeRHmR/VAqpkrWiVSeGp87H
         hdCw==
X-Gm-Message-State: APjAAAX9VbBa57EMWUcyXv6ulniSBPjioAsYDKCPNmWdprMbq3g/Ew9A
	6KzhDeiOO0mHW8XlDgfQqjgLiQDWrW7al/BXBl9/hg==
X-Google-Smtp-Source: APXvYqz/zNSaR5+4fJBic3BvwE8nvJYsPFgWJWIxdv0FXnRWV5GHARWaC/J29mUuifA2I9vWNxUsSCX69SK23Ui//Ww=
X-Received: by 2002:a17:906:3d69:: with SMTP id r9mr34377374ejf.28.1560437124696;
 Thu, 13 Jun 2019 07:45:24 -0700 (PDT)
MIME-Version: 1.0
References: <20190612163144.18486-1-roman.stratiienko@globallogic.com>
 <20190612163144.18486-2-roman.stratiienko@globallogic.com> <20190613135241.aghcrrz7rg2au3bw@MacBook-Pro-91.local>
In-Reply-To: <20190613135241.aghcrrz7rg2au3bw@MacBook-Pro-91.local>
From: Roman Stratiienko <roman.stratiienko@globallogic.com>
Date: Thu, 13 Jun 2019 17:45:13 +0300
Message-ID: <CAODwZ7v=RSsmVj5GjcvGn2dn+ejLRBHZ79x-+S9DrX4GoXuVaQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] nbd: add support for nbd as root device
To: Josef Bacik <josef@toxicpanda.com>
Cc: linux-kernel@vger.kernel.org, nbd@other.debian.org, 
	Aleksandr Bulyshchenko <A.Bulyshchenko@globallogic.com>, linux-block@vger.kernel.org, 
	axboe@kernel.dkn.org
Content-Type: text/plain; charset="UTF-8"
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <HLrCk0Eo7ZF.A.WCH.tWmAdB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/587
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CAODwZ7v=RSsmVj5GjcvGn2dn+ejLRBHZ79x-+S9DrX4GoXuVaQ@mail.gmail.com
Resent-Date: Thu, 13 Jun 2019 15:03:09 +0000 (UTC)

On Thu, Jun 13, 2019 at 4:52 PM Josef Bacik <josef@toxicpanda.com> wrote:
>
> On Wed, Jun 12, 2019 at 07:31:44PM +0300, roman.stratiienko@globallogic.com wrote:
> > From: Roman Stratiienko <roman.stratiienko@globallogic.com>
> >
> > Adding support to nbd to use it as a root device. This code essentially
> > provides a minimal nbd-client implementation within the kernel. It opens
> > a socket and makes the negotiation with the server. Afterwards it passes
> > the socket to the normal nbd-code to handle the connection.
> >
> > The arguments for the server are passed via kernel command line.
> > The kernel command line has the format
> > 'nbdroot=[<SERVER_IP>:]<SERVER_PORT>/<EXPORT_NAME>'.
> > SERVER_IP is optional. If it is not available it will use the
> > root_server_addr transmitted through DHCP.
> >
> > Based on those arguments, the connection to the server is established
> > and is connected to the nbd0 device. The rootdevice therefore is
> > root=/dev/nbd0.
> >
> > Patch was initialy posted by Markus Pargmann <mpa@pengutronix.de>
> > and can be found at https://lore.kernel.org/patchwork/patch/532556/
> >
> > Change-Id: I78f7313918bf31b9dc01a74a42f0f068bede312c
> > Signed-off-by: Roman Stratiienko <roman.stratiienko@globallogic.com>
> > Reviewed-by: Aleksandr Bulyshchenko <A.Bulyshchenko@globallogic.com>
>
> Just throw nbd-client in your initramfs.  Every nbd server has it's own
> handshake protocol, embedding one particular servers handshake protocol into the
> kernel isn't the answer here.  Thanks,
>
> Josef

Hello Josef,

Let me share some of my thoughts that was the motivation for providing
this solution::

We choose NBD as a tool to run CI tests on our platforms.
We have a wide range of different BSP's with different kind of images
where using NFSROOT is hard or even impossible.
Most of these BSPs are not using initramfs and some of them are Android-based.

Taking all this into account we have to put significant efforts to
implement and test custom initramfs and it will not cover all our
needs.

Much easier way is to embed small client into the kernel and just
enable configuration when needed.

I believe such solution will be very useful for wide range of kernel users.

Also, as far as I know mainline nbd-server daemon have only 2
handshake protocols. So called OLD-STYLE and NEW-STYLE. And OLD-STYLE
is no longer supported. So it should not be a problem, or please fix
me if I'm wrong.

Regards,
Roman

