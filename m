Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id D55E14423A
	for <lists+nbd@lfdr.de>; Thu, 13 Jun 2019 18:21:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id A521820418; Thu, 13 Jun 2019 16:21:08 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Jun 13 16:21:08 2019
Old-Return-Path: <roman.stratiienko@globallogic.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,DKIM_VERIFIED,MD5_SHA1_SUM,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id E060320398
	for <lists-other-nbd@bendel.debian.org>; Thu, 13 Jun 2019 16:05:56 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.18 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	MD5_SHA1_SUM=-1, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id OtUFaThZeHWG for <lists-other-nbd@bendel.debian.org>;
	Thu, 13 Jun 2019 16:05:52 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .globallogic. - helo: .mail-ed1-x544.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id D4E6520379
	for <nbd@other.debian.org>; Thu, 13 Jun 2019 16:05:52 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id g13so31976253edu.5
        for <nbd@other.debian.org>; Thu, 13 Jun 2019 09:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=globallogic.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mLABAOBxUi7apPgtRPROSyumsCPedDiB3eVS3aen4Uc=;
        b=OhQ1gd9hI7gUmtNiW/OqjsHiQzwW6iZW8IGNtHnPK8zug5HhC3kYfdVVJXheeoRaC6
         tbmDhYFOS083pJUz6jcfjmqIHLpaa597AhPSvEEAQBLMcwwRZdZ9O7lGn8Jrx1FkCvdA
         RfoNRWL1Q1taE5K1YXiR/zwm5WR9EoJjDgXouRhoyKnyxhNXGKOCVqG682PKrplC0mP1
         Qpfiw8SI/tUrfiIzQe/qG1BF+PWPkB7bpYVgOpQ13Zx0Rbd4MCnxbKjoLNKRwofxot0+
         wUn9KJjxcqacAAr3a+vEKvbp/n79eMo2Fiugl2fTd1aDgFw1RPt3MF66M1s1hvXWy13C
         7JuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mLABAOBxUi7apPgtRPROSyumsCPedDiB3eVS3aen4Uc=;
        b=AFkOBHd0kyYMy1f2JqOBnDAn0LQNvWxIntn2IXwPyCNw6H4YTiULHW/njQL25111TW
         mC7ovLJHY0BdxPcMd8CbhfZGtOHTWccJNgjC84fbCBvuFz0SHeJ1BpvukFMIVrR4D491
         nNvuzCU7oghIMnrAj6MdtODIwfFpVqjbmyVmFU8LLwOujVYzZCEN1NFNlyHMJ6Orm94E
         +629LxWSnqvzx8LdYBjF6RyIwSkbwa1wiCROCrI/U/rHXeBBpgHYD+CJ1BTqobf0A2/J
         2faUfdQBkQlsil4kxUfpE1X48bfGugOV6FYIrdSM5LiLniE9j5U0KHbbipXu35upKvuh
         YaXg==
X-Gm-Message-State: APjAAAXgLgCu5LE5RcTuCE6ZDvEOhReorJVU4a9wkpIPJTCEvmCxhl6e
	ooK+Q4NmRslVUOsdTFfpmQVZPQb9Dju/EDyiiK32cw==
X-Google-Smtp-Source: APXvYqw9eTL1smFdgM5CBMWe55qQwq7Ixm6mxLmSKQlk/U+TTmtbbBQA33hoHb3lK2Sjp3Q8KGTRfudgroyIOzz5krs=
X-Received: by 2002:a50:9918:: with SMTP id k24mr47972367edb.173.1560441949919;
 Thu, 13 Jun 2019 09:05:49 -0700 (PDT)
MIME-Version: 1.0
References: <20190612163144.18486-1-roman.stratiienko@globallogic.com>
 <20190612163144.18486-2-roman.stratiienko@globallogic.com>
 <20190613135241.aghcrrz7rg2au3bw@MacBook-Pro-91.local> <CAODwZ7v=RSsmVj5GjcvGn2dn+ejLRBHZ79x-+S9DrX4GoXuVaQ@mail.gmail.com>
 <adc59944-7654-ea38-8dfc-f91361a80987@redhat.com>
In-Reply-To: <adc59944-7654-ea38-8dfc-f91361a80987@redhat.com>
From: Roman Stratiienko <roman.stratiienko@globallogic.com>
Date: Thu, 13 Jun 2019 19:05:38 +0300
Message-ID: <CAODwZ7u+f9vco8h1ZAwwoCefB6kM9gi4L_Mc7muLXYkwHRVc8Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] nbd: add support for nbd as root device
To: Eric Blake <eblake@redhat.com>
Cc: Josef Bacik <josef@toxicpanda.com>, linux-kernel@vger.kernel.org, 
	nbd@other.debian.org, Aleksandr Bulyshchenko <A.Bulyshchenko@globallogic.com>, 
	linux-block@vger.kernel.org, axboe@kernel.dkn.org
Content-Type: text/plain; charset="UTF-8"
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <0DpcnUMC3oH.A.XBC.0fnAdB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/590
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CAODwZ7u+f9vco8h1ZAwwoCefB6kM9gi4L_Mc7muLXYkwHRVc8Q@mail.gmail.com
Resent-Date: Thu, 13 Jun 2019 16:21:08 +0000 (UTC)

On Thu, Jun 13, 2019 at 6:14 PM Eric Blake <eblake@redhat.com> wrote:
>
> On 6/13/19 9:45 AM, Roman Stratiienko wrote:
>
> >>
> >> Just throw nbd-client in your initramfs.  Every nbd server has it's own
> >> handshake protocol, embedding one particular servers handshake protocol into the
> >> kernel isn't the answer here.  Thanks,
>
> The handshake protocol is well-specified:
> https://github.com/NetworkBlockDevice/nbd/blob/cdb0bc57f3faefd7a5562d57ad57cd990781c415/doc/proto.md
>
> All servers implement various subsets of that document for the handshake.
>
> > Also, as far as I know mainline nbd-server daemon have only 2
> > handshake protocols. So called OLD-STYLE and NEW-STYLE. And OLD-STYLE
> > is no longer supported. So it should not be a problem, or please fix
> > me if I'm wrong.
>
> You are correct that oldstyle is no longer recommended. However, the
> current NBD specification states that newstyle has two different
> flavors, NBD_OPT_EXPORT_NAME (which you used, but is also old) and
> NBD_OPT_GO (which is newer, but is more likely to encounter differences
> where not all servers support it).
>
> The NBD specification includes a compatibility baseline:
> https://github.com/NetworkBlockDevice/nbd/blob/cdb0bc57f3faefd7a5562d57ad57cd990781c415/doc/proto.md#compatibility-and-interoperability
>
> and right now, NBD_OPT_GO (and _not_ NBD_OPT_EXPORT_NAME) is the
> preferred way forward.  As long as your handshake implementation
> complies with the baseline documented there, you'll have maximum
> portability to the largest number of servers that also support the
> baseline - but not all servers are up to that baseline yet.
>
> So, this becomes a question of how much are you reinventing baseline
> portability handshake concerns in the kernel, vs. in initramfs.
>
> --
> Eric Blake, Principal Software Engineer
> Red Hat, Inc.           +1-919-301-3226
> Virtualization:  qemu.org | libvirt.org
>

Thank you for the review comments, I will address them in v2.

--
Regards,
Roman

