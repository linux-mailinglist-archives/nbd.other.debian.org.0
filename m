Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 660A66AC1C6
	for <lists+nbd@lfdr.de>; Mon,  6 Mar 2023 14:49:16 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 27D65207BD; Mon,  6 Mar 2023 13:49:16 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Mar  6 13:49:16 2023
Old-Return-Path: <nsoffer@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,LDOSUBSCRIBER,LDO_WHITELIST,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id AD59620521
	for <lists-other-nbd@bendel.debian.org>; Mon,  6 Mar 2023 13:49:04 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.182 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	RCVD_IN_MSPIKE_H2=-0.001] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 3o6JT_oHgqPd for <lists-other-nbd@bendel.debian.org>;
	Mon,  6 Mar 2023 13:48:57 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by bendel.debian.org (Postfix) with ESMTP id DBB2620782
	for <nbd@other.debian.org>; Mon,  6 Mar 2023 13:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678110531;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=03mR9ejaWocg7Ib6/dl+bzxwahc7bm4b+rJsBMEbL/M=;
	b=fOEKnnHGK5jr3UUrsSo+x1w5+sh42sB2EC7amPLM/cthpXGMsENrIDoCOnW8+cSEHjMN7H
	wM0llLDobJiAEtjlXWrlZOm4iPwcpeEacey/+0pG85TbpRCkqP6yDp0UUoR7Hvzgclrerb
	8i9PcL4SS4JfZvDLb1CZd6VsILi2w0M=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-215-P36jH8IvOYivv4GWW5srTw-1; Mon, 06 Mar 2023 08:48:50 -0500
X-MC-Unique: P36jH8IvOYivv4GWW5srTw-1
Received: by mail-qt1-f200.google.com with SMTP id r3-20020ac84243000000b003b9a3ab9153so5175266qtm.8
        for <nbd@other.debian.org>; Mon, 06 Mar 2023 05:48:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678110530;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=03mR9ejaWocg7Ib6/dl+bzxwahc7bm4b+rJsBMEbL/M=;
        b=7VwVW60kgo3oP4E7Y9cU9Q+rYzga1rkcMIDrV2ucV/gFBJ4wBEsL9VyGW/BqlLNrw/
         uOYDVh4/F4J28rqy/pf7mqekA1DjhdbwGQkEZmEfwQtkUbgJg+jrJBXiOtCRoTkYisIs
         WQyHmX3USKdcw6i8UH1avBGKG+YeQaZMzHSfeMy8q9yUmoYJP0BzMFzdgb4VyEt03h2h
         BIliwX3w+a8YRo9cRj9AUAeS98phkGni5IJ54ky6C3abXKA2Oxjf/flkfFT4B4S1g8Gc
         7LOBOnlMcTPhrIuRJJjVNpL4ZRLScZIq1Si1RHYSRU4Saw+9e8/eQVuGNVjgH/a30nov
         fBBg==
X-Gm-Message-State: AO0yUKWyUAub60ioROdb/a1Mu85PtSXQG47+5B8xAcznAwwik3Pb4Xju
	4ZFDoVvi6Q7Jj2c9v7yaTPkZHP2ezvtM463oCty+2cx/hEd5nJ+l601/F1sS8+wDYtjUTFmwev6
	7Z9lavyXQOdVRxK8xcyxr/0JMTVAygg==
X-Received: by 2002:a05:6214:1927:b0:56b:ee5a:89f0 with SMTP id es7-20020a056214192700b0056bee5a89f0mr2878566qvb.7.1678110529749;
        Mon, 06 Mar 2023 05:48:49 -0800 (PST)
X-Google-Smtp-Source: AK7set9XlW6qh9UVZegaOqagqGBYzDymxUkaQdxGTaqPJWaaSnSMBDIjIZlsmZmFgABopULN+fQXpo2HAHtXUdmoFvU=
X-Received: by 2002:a05:6214:1927:b0:56b:ee5a:89f0 with SMTP id
 es7-20020a056214192700b0056bee5a89f0mr2878561qvb.7.1678110529330; Mon, 06 Mar
 2023 05:48:49 -0800 (PST)
MIME-Version: 1.0
References: <20221114224141.cm5jgyxfmvie5xb5@redhat.com> <20221114224655.2186173-1-eblake@redhat.com>
 <20221114224655.2186173-2-eblake@redhat.com> <f350f0ec-34b1-dca7-5bb0-344a6832f327@yandex-team.ru>
 <20230303221740.pdwc6jtozstntih7@redhat.com> <ZARVwVaRJbgvv/fO@pc220518.home.grep.be>
In-Reply-To: <ZARVwVaRJbgvv/fO@pc220518.home.grep.be>
From: Nir Soffer <nsoffer@redhat.com>
Date: Mon, 6 Mar 2023 15:48:33 +0200
Message-ID: <CAMRbyyvmbjuZWw1tvTf8SX-0odn79kcPCMoevuS_2WM3shNrkA@mail.gmail.com>
Subject: Re: [Libguestfs] [PATCH v2 1/6] spec: Recommend cap on
 NBD_REPLY_TYPE_BLOCK_STATUS length
To: Wouter Verhelst <w@uter.be>
Cc: Eric Blake <eblake@redhat.com>, libguestfs@redhat.com, nbd@other.debian.org, 
	qemu-devel@nongnu.org, qemu-block@nongnu.org, 
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <cEJRXB6UTqB.A.NEG.c9eBkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2354
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CAMRbyyvmbjuZWw1tvTf8SX-0odn79kcPCMoevuS_2WM3shNrkA@mail.gmail.com
Resent-Date: Mon,  6 Mar 2023 13:49:16 +0000 (UTC)

On Sun, Mar 5, 2023 at 10:42=E2=80=AFAM Wouter Verhelst <w@uter.be> wrote:
>
> On Fri, Mar 03, 2023 at 04:17:40PM -0600, Eric Blake wrote:
> > On Fri, Dec 16, 2022 at 10:32:01PM +0300, Vladimir Sementsov-Ogievskiy =
wrote:
> > > s-o-b line missed.
> >
> > I'm not sure if the NBD project has a strict policy on including one,
> > but I don't mind adding it.
>
> I've never required it, mostly because it's something that I myself
> always forget, too, so, *shrug*.
>
> (if there were a way in git to make it add that automatically, that
> would help; I've looked but haven't found it)

What I'm using in all projects that require signed-off-by is:

$ cat .git/hooks/commit-msg
#!/bin/sh

# Add Signed-off-by trailer.
sob=3D$(git var GIT_AUTHOR_IDENT | sed -n 's/^\(.*>\).*$/Signed-off-by: \1/=
p')
git interpret-trailers --in-place --trailer "$sob" "$1"

You can also use a pre-commit hook but the commit-msg hook is more
convenient.

And in github you can add the DCO application to the project:
https://github.com/apps/dco

Once installed it will check that all commits are signed off, and
provide helpful error
messages to contributors.

Nir

