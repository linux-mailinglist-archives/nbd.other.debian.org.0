Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 259295B64E3
	for <lists+nbd@lfdr.de>; Tue, 13 Sep 2022 03:06:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id BB40F2078B; Tue, 13 Sep 2022 01:06:12 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Sep 13 01:06:12 2022
Old-Return-Path: <richard.elling@richardelling.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MURPHY_SCAM1,RCVD_IN_DNSWL_NONE,
	T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id E1CE320784
	for <lists-other-nbd@bendel.debian.org>; Tue, 13 Sep 2022 00:50:24 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.109 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	MIME_QP_LONG_LINE=0.001, MURPHY_SCAM1=0.1, RCVD_IN_DNSWL_NONE=-0.0001,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id Jp5ExOIlpqJ3 for <lists-other-nbd@bendel.debian.org>;
	Tue, 13 Sep 2022 00:50:21 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .richardelling. - helo: .mail-pg1-x530.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 41545206DA
	for <nbd@other.debian.org>; Tue, 13 Sep 2022 00:50:17 +0000 (UTC)
Received: by mail-pg1-x530.google.com with SMTP id g4so9867295pgc.0
        for <nbd@other.debian.org>; Mon, 12 Sep 2022 17:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=richardelling.com; s=google;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :from:content-transfer-encoding:from:to:cc:subject:date;
        bh=lFKIq+x3U5g6zeX5oCvhSHqiB3K7TT+j96xWCrIS9ss=;
        b=KsmTvVRTdsIfDzViJRWgbsB5QVB7cwUQ35X10yrMd3CAS87jcegpujKqtJIBn8y9D+
         tzv3cd+gegXC1lsfv3oGBOKIPHCtT6JMQHiM4/A7ucGwnZu0KAVxhNdZAJsPVMQPjomd
         gcWRhgE7V2fQm8rk5fI3oo7NG2HRGulWDLvCI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :from:content-transfer-encoding:x-gm-message-state:from:to:cc
         :subject:date;
        bh=lFKIq+x3U5g6zeX5oCvhSHqiB3K7TT+j96xWCrIS9ss=;
        b=5pfhUiBzUFgi/Wn/I1JhCGnPgY/6jDWVPdKiqamrUluBcKMbDMdE7ot1u6SEfpV4H8
         qZg5VGISO2Q1MA0UfaPitKQ94TbaqOYBK3xasw0R9f1fqf5AIl0ZBOyhWEhk3n87Nmw5
         WiQ+ToC6ByStjmdc2jEDtjF0QCk13Uz31vQNmeDYxDqaveUQ4KxiDgLcdnIWOMPetbb1
         N1zVn/OEYIzo1JkTA6D0yNcC1nBoROjdmCo2zy2pIJcQoGYhb82uS+1ofXSt8NcTJCKf
         d8RjFcJCEJmNAfqBOLTutWCTaWaCtdwEstbElnLn3IuqgRBRegFU4gbpRpLIb7lRhQV8
         x5/g==
X-Gm-Message-State: ACgBeo0Fgem5YoTHggx75TdWS2ZPF/05aqy4elVJTHWTuPAoORilTSAJ
	kMTSMQ6y6xypYeKcSzIsqwyEsQ==
X-Google-Smtp-Source: AA6agR4T2063kWMEYTDzS1VTb8pcsTZxRPpUJQ6aI1/uezy42kwGh1t4BTzboXD2zfe87G3X2X5DQA==
X-Received: by 2002:a05:6a00:1ad0:b0:545:b61b:fe7 with SMTP id f16-20020a056a001ad000b00545b61b0fe7mr1941687pfv.25.1663030213699;
        Mon, 12 Sep 2022 17:50:13 -0700 (PDT)
Received: from smtpclient.apple ([2607:fb90:7313:8cc2:d11c:c98f:1ca3:1557])
        by smtp.gmail.com with ESMTPSA id a5-20020a17090a740500b0020087d7e778sm5814001pjg.37.2022.09.12.17.50.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Sep 2022 17:50:13 -0700 (PDT)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Richard Elling <richard.elling@richardelling.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [zfs-discuss] ZFS-on-NBD
Date: Mon, 12 Sep 2022 17:50:12 -0700
Message-Id: <608D594E-DE1E-45AE-A7E0-990ABA4EB230@richardelling.com>
References: <230432cbcf171bee3f575edefd0e9805@assyoma.it>
Cc: libguestfs@redhat.com, nbd@other.debian.org
In-Reply-To: <230432cbcf171bee3f575edefd0e9805@assyoma.it>
To: Discuss <zfs-discuss@list.zfsonlinux.org>
X-Mailer: iPhone Mail (19F77)
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <a5qr99AuSQH.A.iaE.Ee9HjB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2221
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/608D594E-DE1E-45AE-A7E0-990ABA4EB230@richardelling.com
Resent-Date: Tue, 13 Sep 2022 01:06:12 +0000 (UTC)

just a few comments
+ using S3 as a block device will always suffer from the fact that it really=
 isn=E2=80=99t a block device=E2=80=A6 hiding it behind any other block devi=
ce interface won=E2=80=99t really help except in very constrained cases (bas=
ically, what you proved again)
+ ZFS aggregates writes, which further complicates fake block device interfa=
ces
+ there is a dev effort to come up with an object-based vdev type, but I=E2=80=
=99m not aware of its current status
+ L2ARC is definitely not a write-through cache

  -- richard



> On Sep 12, 2022, at 2:55 PM, Gionatan Danti <g.danti@assyoma.it> wrote:
>=20
> =EF=BB=BFIl 2022-09-12 22:30 Nikolaus Rath ha scritto:
>> Hi all,
>> In case people have been wondering about the background of the various
>> questions that I asked on these lists in the last few months:
>> I've been experimenting with running ZFS-on-NBD as a cloud backup
>> solution (and potential alternative to S3QL, which I am using for this
>> purpose at the moment).
>> In case someone is interested, here is the (rather long) write-up:
>> https://www.rath.org/s3ql-vs-zfs-on-nbd.html
>=20
> Interesting reading, thanks!
>=20
> --=20
> Danti Gionatan
> Supporto Tecnico
> Assyoma S.r.l. - www.assyoma.it
> email: g.danti@assyoma.it - info@assyoma.it
> GPG public key ID: FF5F32A8
>=20
> ------------------------------------------
> zfsonlinux: Discuss
> Permalink: https://zfsonlinux.topicbox.com/groups/zfs-discuss/Tf25eefa7a2a=
2b7c5-M5c2f144e1829136187c173df
> Delivery options: https://zfsonlinux.topicbox.com/groups/zfs-discuss/subsc=
ription

