Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id C34F56AAC75
	for <lists+nbd@lfdr.de>; Sat,  4 Mar 2023 21:36:23 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id A758620843; Sat,  4 Mar 2023 20:36:23 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sat Mar  4 20:36:23 2023
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
	by bendel.debian.org (Postfix) with ESMTP id 3410E20831
	for <lists-other-nbd@bendel.debian.org>; Sat,  4 Mar 2023 20:36:13 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.182 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	RCVD_IN_MSPIKE_H2=-0.001] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id DuTSSs68-01Y for <lists-other-nbd@bendel.debian.org>;
	Sat,  4 Mar 2023 20:36:06 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by bendel.debian.org (Postfix) with ESMTP id E2A5B20830
	for <nbd@other.debian.org>; Sat,  4 Mar 2023 20:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677962160;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1q/sPxOKcmclrKfzQm3oCeB6oRbD7pDd4OMVAApQNn8=;
	b=Y1y9gpzjHl7lkQpn48SikEUvuZduzn6Vkdilp0LTcHLhEYVVY/MY/9GPeRj8/sXhQo+xOj
	XpQT0cSi6C3cdzUxTteiuQyVIfp7bU6x4MP/9aA/Z77t7v0lyqbTbHpXWju4Y01RqOyjLf
	M/muFWcsGi5DjcG9WuVQ3lNTFq+3814=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-433-2mJSilK-NxOb4MDy4x25SQ-1; Sat, 04 Mar 2023 15:04:03 -0500
X-MC-Unique: 2mJSilK-NxOb4MDy4x25SQ-1
Received: by mail-qt1-f197.google.com with SMTP id r4-20020ac867c4000000b003bfefb6dd58so3304665qtp.2
        for <nbd@other.debian.org>; Sat, 04 Mar 2023 12:04:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677960243;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1q/sPxOKcmclrKfzQm3oCeB6oRbD7pDd4OMVAApQNn8=;
        b=X+GttkVFQTq9dccwuR8I/S7qa8VLu3+QP5CbUvGY4FSZ+FLXl5NCwi8mUI3c8wxAcp
         Cmn6xD9ZnRNYd+TAsjjcP3Ug7FsDjtBO2Xb2H9KOJR68k9SFWQZX7w/xe7ct+BppgXry
         2cL9ZVkVclq5Til7rea2d5FkYOLCvMIxB083wGWEh2yqO7GrDVRg1E72kAD4kcdi336M
         y/BG7aHM7+g2UZiVni1cYH/iw437g4tjZqbqbDz5Ytdlk0zBDuOs6yy7SWVo2YdsMNXT
         q1aPYkRIo7Y9xRBzj2xYMpP3UcjZvhYzAAL+QYiiJZlKLcLVdrfh/1WHTe5F/SyXPq+i
         r8vg==
X-Gm-Message-State: AO0yUKVDE1LnZP0eUAvRaBwUbImckoFdUkduV4tke/LPH6Sjm9IGz8a2
	nfT5358QHPXoQagwtSCR5+K9tu38mS4iFOc9Xbwf7DkA+3KMBwi0QflCzqP1kpFsEDuf7SjqJ3D
	moy5Hn0N7iV1XxHItfCLV0j5A02Su8w==
X-Received: by 2002:a37:64d2:0:b0:742:71e6:b8d4 with SMTP id y201-20020a3764d2000000b0074271e6b8d4mr1440575qkb.6.1677960242766;
        Sat, 04 Mar 2023 12:04:02 -0800 (PST)
X-Google-Smtp-Source: AK7set+Vr/NtIlsxt31DAh3CmlDqwmLnhPfdfVaesQlThDVecn2So62FtWbCvIBam+zAkbmI5vHwlI8vmRlToaflw4g=
X-Received: by 2002:a37:64d2:0:b0:742:71e6:b8d4 with SMTP id
 y201-20020a3764d2000000b0074271e6b8d4mr1440572qkb.6.1677960242495; Sat, 04
 Mar 2023 12:04:02 -0800 (PST)
MIME-Version: 1.0
References: <20230303221503.1769410-1-eblake@redhat.com>
In-Reply-To: <20230303221503.1769410-1-eblake@redhat.com>
From: Nir Soffer <nsoffer@redhat.com>
Date: Sat, 4 Mar 2023 22:03:46 +0200
Message-ID: <CAMRbyyuN6xFNkqyCacU=PxBqwTKdPNdO6dW1FQgTpAyWHLs7uw@mail.gmail.com>
Subject: Re: [Libguestfs] [PATCH] docs: Prefer 'cookie' over 'handle'
To: Eric Blake <eblake@redhat.com>
Cc: nbd@other.debian.org, libguestfs@redhat.com, qemu-block@nongnu.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <6nsQHeq8QRB.A.wwF.Hv6AkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2347
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CAMRbyyuN6xFNkqyCacU=PxBqwTKdPNdO6dW1FQgTpAyWHLs7uw@mail.gmail.com
Resent-Date: Sat,  4 Mar 2023 20:36:23 +0000 (UTC)

On Sat, Mar 4, 2023 at 12:15=E2=80=AFAM Eric Blake <eblake@redhat.com> wrot=
e:
>
> In libnbd, we quickly learned that distinguishing between 'handle'
> (verb for acting on an object) and 'handle' (noun describing which
> object to act on) could get confusing; we solved it by renaming the
> latter to 'cookie'.  Copy that approach into the NBD spec, and make it
> obvious that a cookie is opaque data from the point of view of the
> server.

Good change, will make it easier to search code.

But the actual text does not make it clear that a cookie is opaque data fro=
m
point of view of the client. Maybe make this more clear?

> Makes no difference to implementations (other than older code
> still using 'handle' may be slightly harder to tie back to the spec).

To avoid confusion with older code that carefully used "handle" to match
the spec, maybe add a note that "cookie" was named "handle" before?

Nir

