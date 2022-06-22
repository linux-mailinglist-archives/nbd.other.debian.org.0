Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id DD27C554EFE
	for <lists+nbd@lfdr.de>; Wed, 22 Jun 2022 17:21:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id A3CE220288; Wed, 22 Jun 2022 15:21:12 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Jun 22 15:21:12 2022
Old-Return-Path: <lerwickfinance7@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,T_SCC_BODY_TEXT_LINE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 8104520434
	for <lists-other-nbd@bendel.debian.org>; Wed, 22 Jun 2022 15:04:31 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=0.031 tagged_above=-10000 required=5.3
	tests=[BAYES_40=-0.01, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
	RCVD_IN_DNSWL_NONE=-0.0001, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id nBJGgIL_uYjx for <lists-other-nbd@bendel.debian.org>;
	Wed, 22 Jun 2022 15:04:26 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id EE130203F5
	for <nbd@other.debian.org>; Wed, 22 Jun 2022 15:04:23 +0000 (UTC)
Received: by mail-pg1-x533.google.com with SMTP id z14so16376820pgh.0
        for <nbd@other.debian.org>; Wed, 22 Jun 2022 08:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=vhZEVnaGNBjosB86GDUW8b2wHjB/+QU31bPXl36TqFE=;
        b=fedxHvpvYGaAl1C0u3mJS1WoqvPB0oNNv7icLw40leErOjShqlvVem53l7VAdJ6upZ
         L9z5WDHmzLExverqd2Mlj95gGjQNvvfXGnx/i35Q2Ukq7ibfZ94eDaBTK5a+fKxCwP9O
         nRqYHOUWNZbkQn4UDeTvF4NpuW50CznfhSBqvOQCWCJHDLNswJAJnAsJ8jsQqPdE4jnq
         COrGXKAi62bwJ046zRD4eFm00hgqMY3inLGwy6XN2qkeNHYLqNbYEBgBhwM15vCVcLdM
         zu151re4CU2NRmtTbOO+KWSATgrrIcFFv7vuukzb8K7ulGrwY+Hhv/D6dxqdTnZkPpNA
         PZ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=vhZEVnaGNBjosB86GDUW8b2wHjB/+QU31bPXl36TqFE=;
        b=CfnFtG/SMDm9lmzH2DJJtLw6gVESXB64G9oP16Vdp06Brg7mXnrvsmxzeA2XH3XCAS
         c3Iku538wWIuNh8tOI/QxSvuO4qCbt1PTlczyyuXjnDve/jQeurrosxHpw+y0bnW+quk
         MorxY7k+PlnidSPZp1XkI4Bmzkv4OmeYgi/BBL2oNQYYu/3mtxfpjtpXln7KJAagoWw8
         AcXs2h85X2C7ceYRNL5PKRiIVEhzRBJ+TwlMDwKbZ61GtDMWNIwN+q96ncRXuTHB0705
         4DHFInkvRE5JyLsGh60DfZsPUqZTTsnvycpx+QgM0azzXBPGi9PtKISjGvjRaitFGcwy
         5MUQ==
X-Gm-Message-State: AJIora+pOtzLFw4LanOLU7QtQwEQd37djktxKS8q63S3E0j8n1goz2xY
	mRhUS2UwS/oB08/pO7oNQKuenDeIZ3uo7CwHNkk=
X-Google-Smtp-Source: AGRyM1tystIslg9uNVcUOMzYR8GYNz8Amo4b63MeZP0gXSY5EfclQ79Nr4WF60Irm+FNisTL7itfLErKePPDvZ9Q4yo=
X-Received: by 2002:a05:6a00:225a:b0:525:4d37:6b30 with SMTP id
 i26-20020a056a00225a00b005254d376b30mr1469916pfu.83.1655910260294; Wed, 22
 Jun 2022 08:04:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:903:2308:b0:16a:1b3f:f74b with HTTP; Wed, 22 Jun 2022
 08:04:19 -0700 (PDT)
Reply-To: sales0212@asonmedsystemsinc.com
From: Prasad Ronni <lerwickfinance7@gmail.com>
Date: Wed, 22 Jun 2022 16:04:19 +0100
Message-ID: <CAFkto5smHNaF1-vVzk=Z1eS16uFFKvVSRfL+KNTa=bLCi1i03g@mail.gmail.com>
Subject: Service Needed.
To: undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <fcDFgJyQ1hJ.A.nIB.oNzsiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2174
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CAFkto5smHNaF1-vVzk=Z1eS16uFFKvVSRfL+KNTa=bLCi1i03g@mail.gmail.com
Resent-Date: Wed, 22 Jun 2022 15:21:12 +0000 (UTC)

-- 
Hi,

Are you currently open to work as our executive company representative
on contractual basis working remotely? If yes, we will be happy to
share more details. Looking forward to your response.

Regards,

