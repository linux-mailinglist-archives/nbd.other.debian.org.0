Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
Delivered-To: lists+nbd@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8H1MDtclqGlhowAAu9opvQ
	(envelope-from <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>)
	for <lists+nbd@lfdr.de>; Wed, 04 Mar 2026 13:30:15 +0100
X-Original-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC021FFB27
	for <lists+nbd@lfdr.de>; Wed, 04 Mar 2026 13:30:14 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 69EFC20629; Wed,  4 Mar 2026 12:30:14 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Mar  4 12:30:14 2026
Old-Return-Path: <donald.hunter@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=4.0 tests=DATE_IN_PAST_96_XX,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 6D9C92064F
	for <lists-other-nbd@bendel.debian.org>; Wed,  4 Mar 2026 12:12:33 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=2.706 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, BODY_8BITS=1.5, DATE_IN_PAST_96_XX=3.405,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id YVIzHrbcFQkN for <lists-other-nbd@bendel.debian.org>;
	Wed,  4 Mar 2026 12:12:26 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "WR4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id E14A22065E
	for <nbd@other.debian.org>; Wed,  4 Mar 2026 12:12:26 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-48371119eacso82384195e9.2
        for <nbd@other.debian.org>; Wed, 04 Mar 2026 04:12:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772626343; x=1773231143; darn=other.debian.org;
        h=content-transfer-encoding:mime-version:user-agent:references
         :message-id:date:in-reply-to:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5PBIpDZUoWmzMLSSr4AMFrJThU2kmJNnnlCij9fJqvY=;
        b=WHi2VYCtPO5E6Wk+bnBdDWLGNlOeLOXQI9v7erPdPJyQ+qTB74PPnLjwwVv/KGvlCa
         Pd0GyVem6PNwB4Ruvq1rLG472E8C8A2fuIYgZlaUP1U5PBfns7ZPPw0xYGXU386lrCK+
         rkKSeZB+wxtvQxUEyViSL6L9NE9jAbG+ELQckvlHGhkc5OeZgVoTp3eD3Gj0RcO20Ajv
         7nI4TF74+9ymfg7gX9eXHJimue1an7ONT3dRTJbe05BIP0WrM/JOKu7LMo/N6C59euxC
         tqsfSegnrcmUIoPcbuYM2F/v3qoN3T7o/8OH0DD2Ti/5os6n7hKqDpQCEQlyyfVvoKJB
         hWmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772626343; x=1773231143;
        h=content-transfer-encoding:mime-version:user-agent:references
         :message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5PBIpDZUoWmzMLSSr4AMFrJThU2kmJNnnlCij9fJqvY=;
        b=rabAQBaa3vi4CRIzUbW1DzehZ09lNN2X2RqaRHqdT3utKUKwHPPbfZ0pPuxKZabEyl
         11AHnnXmGjuXhmM3SH5fkm6tMn64TmaJmsdHbFJ+yGcaIYv1Y/YmCVYvCgQ9MlV9sRCK
         LfcOzMXWDjm8YFaGgY+6BTlUNhOvC+qMnxrwkYODRmZsR6F6lacFL2Z3g8bpjGIr9ufY
         nsGNr6eck+BggVtHPpJvE8RuozzTAaWqP+4DJhEivO0kirLWXE0du/rNm/L/qAuRnlDK
         mKK0Z0ImpvZmb0YTeo6/BFoi6LSLZU547ICWlS1o/znetVKv+D1cyEe4AwJ8WCXq+ChK
         2GOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUsy9MNncIm07zw7e/ITwYVfJWVLm9aTaTC/MB+Y73ALrBGbX8HI+RvlNxrPtIjOAl7Kc4=@other.debian.org
X-Gm-Message-State: AOJu0Yx3FdpPnjwtU/Bc2PB4XZsJXC1Xxl2whZ4+SGZyZGQZrdSMObC1
	sYwIZb4C5oVB9WGKLvh/XhcDkV4HbUN1HtbIIkyghH9vR3xOrqel/j09CZfw5g==
X-Gm-Gg: ATEYQzwiAyMYd8T8UB8K6esOOfNGQJhDFO3nlr8GikNCANMMdIUQqJ5Of6FAYLdvMjP
	S4RtzELsrb+m+R8XJO354luwHQh+WTL4WFD8I+0pBciaJShln7JG96d4AX9GLal8biCkwWRaL8K
	5n4S9TA6zOG2DJ1lqjFvOOQ7Kd56uPctE0VrdjMPAPX6K79Cshqv7tYlphI8YPP0YdsQxrpV3J3
	RSuz+tlb/3LkMrAvn/B7kWm5WJWUjHVe59u5w8Ja4bHo85gCqRa06i7iWKYOa/Vw6IaB9qvKbAs
	G2XCpxgdRx03bUDajhnvGiA7UDDsmQS5W882DtTMKwRa2phO+aPJtqrvwXIGqP3SYp/28LqymYY
	fu5M3My79jhZjEy28GxOsYzmCxOJXIWRKJDYjq5VI747Na3XxDdY2waYi13G4YBDjJveLSE3DJq
	GkzT1QaxxTXMtnCvVG+NSTJrgLRg==
X-Received: by 2002:a05:600c:1f85:b0:47e:e712:aa88 with SMTP id 5b1f17b1804b1-4851989f765mr30694295e9.31.1772626342560;
        Wed, 04 Mar 2026 04:12:22 -0800 (PST)
Received: from imac ([88.97.103.74])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485188923c2sm48580075e9.14.2026.03.04.04.12.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 04:12:21 -0800 (PST)
From: Donald Hunter <donald.hunter@gmail.com>
To: Hristo Venev <hristo@venev.name>
Cc: Jakub Kicinski <kuba@kernel.org>,  "David S. Miller"
 <davem@davemloft.net>,  Eric Dumazet <edumazet@google.com>,  Paolo Abeni
 <pabeni@redhat.com>,  Simon Horman <horms@kernel.org>,
  netdev@vger.kernel.org,  Josef Bacik <josef@toxicpanda.com>,  Jens Axboe
 <axboe@kernel.dk>,  linux-block@vger.kernel.org,  nbd@other.debian.org
Subject: Re: [PATCH] netlink: specs: add specification for NBD
In-Reply-To: <6a1339999b091edaaa15e34aceb7961dfc61581b.camel@venev.name>
Date: Wed, 18 Feb 2026 11:28:44 +0000
Message-ID: <m2fr6yl28j.fsf@gmail.com>
References: <20260215180309.2255721-3-hristo@venev.name>
	<m2o6lnlg2y.fsf@gmail.com>
	<6a1339999b091edaaa15e34aceb7961dfc61581b.camel@venev.name>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <_9vcFyRQn4B.A.PGZP.WXCqpB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3511
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/m2fr6yl28j.fsf@gmail.com
Resent-Date: Wed,  4 Mar 2026 12:30:14 +0000 (UTC)
X-Rspamd-Queue-Id: CEC021FFB27
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.11 / 15.00];
	DATE_IN_PAST(1.00)[337];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[82.195.75.100:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:hristo@venev.name,m:kuba@kernel.org,m:davem@davemloft.net,m:edumazet@google.com,m:pabeni@redhat.com,m:horms@kernel.org,m:netdev@vger.kernel.org,m:josef@toxicpanda.com,m:axboe@kernel.dk,m:linux-block@vger.kernel.org,m:nbd@other.debian.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[nbd=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[lists-other-nbd@bendel.debian.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[donaldhunter@gmail.com,bounce-nbd=lists@other.debian.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	R_SPF_NA(0.00)[no SPF record];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[donaldhunter@gmail.com,bounce-nbd=lists@other.debian.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:8365, ipnet:82.195.64.0/19, country:DE];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[nbd];
	DBL_BLOCKED_OPENRESOLVER(0.00)[venev.name:email]
X-Rspamd-Action: no action

Hristo Venev <hristo@venev.name> writes:

> On Tue, 2026-02-17 at 12:17 +0000, Donald Hunter wrote:
>> There are yamllint errors:
>>=20
>> make -C tools/net/ynl lint
>> make: Entering directory '/home/donaldh/net-next/tools/net/ynl'
>> yamllint ../../../Documentation/netlink/specs
>> ../../../Documentation/netlink/specs/nbd.yaml
>> =C2=A0 159:81=C2=A0=C2=A0=C2=A0 error=C2=A0=C2=A0=C2=A0 line too long (1=
04 > 80 characters)=C2=A0 (line-
>> length)
>> =C2=A0 169:6=C2=A0=C2=A0=C2=A0=C2=A0 error=C2=A0=C2=A0=C2=A0 syntax erro=
r: expected <block end>, but found
>> '<block mapping start>' (syntax)
>> =C2=A0 170:7=C2=A0=C2=A0=C2=A0=C2=A0 error=C2=A0=C2=A0=C2=A0 wrong inden=
tation: expected 5 but found 6=C2=A0
>> (indentation)
>
> Thanks, I will fix the lint errors in v2.
>
>> > +doc: See :file:`drivers/block/nbd.c`
>>=20
>> Prefer to see a meaningful doc string here.
>
> I will add more proper documentation in v2. I couldn't find any
> existing documentation of this netlink interface, so I guess I will
> write it myself.
>
>> > +attribute-sets:
>> > +=C2=A0 -
>> > +=C2=A0=C2=A0=C2=A0 name: nbd-attrs
>> > +=C2=A0=C2=A0=C2=A0 name-prefix: nbd-attr-
>> > +=C2=A0=C2=A0=C2=A0 doc: Configuration policy attributes, used for CON=
NECT
>> > +=C2=A0=C2=A0=C2=A0 attributes:
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 name: unspec
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 value: 0
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 type: unused
>>=20
>> No need for unspec in the attribute list, ynl codegen does the right
>> thing.
>
> For me `pyynl.ynl_gen_c --mode uapi --header` no longer generates
> `NBD_ATTR_UNSPEC` if I remove this. Is there a YNL property to specify
> the name of the zero value of the attribute set? If not, should I
> remove it anyway, changing the generated header?

Oh sorry, if your goal is 100% equivalence then I guess you need it. We
have the same in "fou" for example.

>> > +operations:
>> > +=C2=A0 enum-model: unified
>> > +=C2=A0 name-prefix: nbd-cmd-
>> > +=C2=A0 list:
>> > +=C2=A0=C2=A0=C2=A0 -
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 name: unspec
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 value: 0
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 doc: NBD_CMD_UNSPEC
>
> A similar question applies here. If I remove this, `pyynl.ynl_gen_c
> --mode uapi --header` no longer generates `NBD_CMD_UNSPEC`. Is there a
> YNL property to generate it? If not, should I remove it anyway?

You'll need to keep it for equivalence.

>> > +=C2=A0=C2=A0=C2=A0 -
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 name: connect
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 doc: See :file:`drivers/block/nbd.c`,
>> > :code:`nbd_genl_connect()`
>>=20
>> Prefer to see meaningful doc string (same for other ops)
>
> I guess I will have to document the four operations in v2 as well.
>
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 attribute-set: nbd-attrs
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dont-validate: [strict]
>>
>> nbd.c has strict & dump, should this be [strict, dump] ? (same for
>> other ops)
>
> The NBD operations don't have `dump`, only `do`, so adding `dump` to
> `dont-validate` does not change the output of `pyynl.ynl_gen_c --mode
> kernel --source`. Should I add it anyway?

Ah, so it's redundant in nbd.c.

Thanks,
Donald.

