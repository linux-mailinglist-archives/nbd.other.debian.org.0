Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id E0BBDBC9B69
	for <lists+nbd@lfdr.de>; Thu, 09 Oct 2025 17:15:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id A09F5205D9; Thu,  9 Oct 2025 15:15:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Oct  9 15:15:10 2025
Old-Return-Path: <paul@paul-moore.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,GMAIL,RCVD_IN_DNSWL_NONE autolearn=no
	autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 4E5BA205D8
	for <lists-other-nbd@bendel.debian.org>; Thu,  9 Oct 2025 14:59:31 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.2 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, GMAIL=1,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 4h8bsJKLxDHo for <lists-other-nbd@bendel.debian.org>;
	Thu,  9 Oct 2025 14:59:25 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .paul-moore. - helo: .mail-pj1-x1031.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "WR4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 431B3205CE
	for <nbd@other.debian.org>; Thu,  9 Oct 2025 14:59:21 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-3307de086d8so1079958a91.2
        for <nbd@other.debian.org>; Thu, 09 Oct 2025 07:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1760021958; x=1760626758; darn=other.debian.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ahjgOspVOdMfoAz+ojX32xnetLiqRNtvEWbGqK6jlpg=;
        b=H6C9XBk/ymAgeZlwXv/HgWskJeYhS5FsEDstqT09uR3qU4tDwTrMyE7J8Qv+bx3vci
         j/UUYklQJEzTlmHooVYvy8128VgIWs77bhXYm0r24QOzMJjUY0qS6cATE++pssuz2t1b
         Bx+6u/0yqh4XEsJFH4E9IlKOk+7/QcC/+50AUgIhcsBFCb6c8e0SiJmW7WmwQJ0hUvge
         wXSovePHhuK7g1AixFgAgVB/upYhsIzH75iRkZOlJNdkmiS36uFQWGTpZ8Bo9VRK+7Sp
         OwjfRTgo35SYUKTOEPWabiPFu00N47nmlc8SZ7AynM6Sk9QCsOtXgjvTjSvm0rEM0NfX
         9dmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760021958; x=1760626758;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ahjgOspVOdMfoAz+ojX32xnetLiqRNtvEWbGqK6jlpg=;
        b=BgaWzWcTy4Z7hxkXaJjKvbenrcgZoJ+bTQJIA+spSpkUYwiA6gyITygZ5FHRCNpxLU
         S9iU2yLR6vRAGvd7sd/i1s16ijCVCoxabbDu/nNU58yk7712/pYsE5KYbasvgrGmvmZG
         QCSb4gdDFxtMEhLYhcHOrra2jzCnPQ6NwWn7eJsfxQwug0EYFB0G6YxcZ+UhWmqQzSpv
         30lXvft2tADUfubwNE3ZqW9Nm7FSQdxynHwbIEAGCdCWDlYu3YHDlZ9a11K9vNndrLwq
         +Y0qeVo//NsU4ECI65hEBH+YbQm69JZ2+YFRtXiztXU8C8OsFCTkjuUm3k1uLSWUCilC
         jyFg==
X-Forwarded-Encrypted: i=1; AJvYcCUo2vVKPa5fzgk9mrFtaSm9nR4yi/qSSfYskiFZ9Wp4OqnBPM23flkb+o4w/WgxuKZnu6o=@other.debian.org
X-Gm-Message-State: AOJu0YzzJQI5oSMPmL4OCTvrcr0VnrhtAbnpBWkpUmFa8+mAZnyb5D8C
	ZbyJk53jGTWXT0Dr5XswRY3C/lcPmpwBBgb7DkQQ7UWhBjD2ob1VZRLT96Meo5QBSqaN1UQSAXc
	x8/khq9HEdqsX0A618Ew91vbY+XnXcVwtStwroFam
X-Gm-Gg: ASbGncvkwzh1zGqSZLmBT2t9dWKlzbtF567p3DOv21Bw9S3L/DH9YtVjYb5X5rQT/Up
	KKSXQ2TyG0e+iDANKjrRMdSNnM5+VKNfq7Za234GoJiwi67UxE5bOat0Vztl2uN7otTu/1jtr0Q
	6iARr6tpYoj2fyQBuhY7YuWyjw+glFNsqzVsVtEhZkOljBDrLQfuo+Z2fW9COSIz+ZvOwY0w+Ll
	GwducfV2lme6ceMifw/meXc+jhGz8k=
X-Google-Smtp-Source: AGHT+IFf2eEZ8Y3dwPHYfsVPR85J/bW2SFKaZNq78idaJg/NJwVTub7Z+ubYcdUX+OzcCgA2pvccKjX4/bJU8TSe2e4=
X-Received: by 2002:a17:90b:3810:b0:339:bf9e:62a6 with SMTP id
 98e67ed59e1d1-33b51129786mr11695081a91.11.1760021957340; Thu, 09 Oct 2025
 07:59:17 -0700 (PDT)
MIME-Version: 1.0
References: <20251009134542.1529148-1-omosnace@redhat.com> <CAEjxPJ5FVGt0KR=wNmU=e_R5cD6T4K1VRabaZmDAWMd0ZNnPNA@mail.gmail.com>
In-Reply-To: <CAEjxPJ5FVGt0KR=wNmU=e_R5cD6T4K1VRabaZmDAWMd0ZNnPNA@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 9 Oct 2025 10:59:05 -0400
X-Gm-Features: AS18NWCQ7y7YKQUxDIqDE5v5atyeT9gE-uS-Jx9EA3wAYJDjv0gABnAz5t8dd9E
Message-ID: <CAHC9VhTCa_SgkOrJVtf1dz0bYt+cyWAUwDWx16MxL9mMRSogDw@mail.gmail.com>
Subject: Re: [PATCH] nbd: override creds to kernel when calling sock_{send,recv}msg()
To: Stephen Smalley <stephen.smalley.work@gmail.com>
Cc: Ondrej Mosnacek <omosnace@redhat.com>, Josef Bacik <josef@toxicpanda.com>, 
	Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org, nbd@other.debian.org, 
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org, 
	Ming Lei <ming.lei@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <dVcihv3CXjO.A.8diP.-F95oB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3450
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CAHC9VhTCa_SgkOrJVtf1dz0bYt+cyWAUwDWx16MxL9mMRSogDw@mail.gmail.com
Resent-Date: Thu,  9 Oct 2025 15:15:10 +0000 (UTC)

On Thu, Oct 9, 2025 at 10:34=E2=80=AFAM Stephen Smalley
<stephen.smalley.work@gmail.com> wrote:
> On Thu, Oct 9, 2025 at 9:45=E2=80=AFAM Ondrej Mosnacek <omosnace@redhat.c=
om> wrote:
> >
> > sock_{send,recv}msg() internally calls security_socket_{send,recv}msg()=
,
> > which does security checks (e.g. SELinux) for socket access against the
> > current task. However, _sock_xmit() in drivers/block/nbd.c may be calle=
d
> > indirectly from a userspace syscall, where the NBD socket access would
> > be incorrectly checked against the calling userspace task (which simply
> > tries to read/write a file that happens to reside on an NBD device).
> >
> > To fix this, temporarily override creds to kernel ones before calling
> > the sock_*() functions. This allows the security modules to recognize
> > this as internal access by the kernel, which will normally be allowed.

...

> > @@ -2706,6 +2720,8 @@ static void __exit nbd_cleanup(void)
> >
> >         nbd_dbg_close();
> >
> > +       put_cred(nbd_cred);
> > +
>
> Should this be done at the end, after the workqueue is destroyed?

I didn't trace the send side, but it does look like the receive side
could end up calling into __sock_xmit() while the workqueue is still
alive.

> >         mutex_lock(&nbd_index_mutex);
> >         idr_for_each(&nbd_index_idr, &nbd_exit_cb, &del_list);
> >         mutex_unlock(&nbd_index_mutex);
> > --
> > 2.51.0

--=20
paul-moore.com

