Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
Delivered-To: lists+nbd@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id itFqGrxglGk6DQIAu9opvQ
	(envelope-from <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>)
	for <lists+nbd@lfdr.de>; Tue, 17 Feb 2026 13:36:12 +0100
X-Original-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 146EC14C03B
	for <lists+nbd@lfdr.de>; Tue, 17 Feb 2026 13:36:11 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id A86F12059D; Tue, 17 Feb 2026 12:36:11 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Feb 17 12:36:11 2026
Old-Return-Path: <donald.hunter@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.6 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,FREEMAIL_FROM,GB_FAKE_RF,
	RCVD_IN_DNSWL_NONE autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id B3EBA205CC
	for <lists-other-nbd@bendel.debian.org>; Tue, 17 Feb 2026 12:18:20 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.099 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id evjqnJLRoe9U for <lists-other-nbd@bendel.debian.org>;
	Tue, 17 Feb 2026 12:18:14 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "WR4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id E5DF7205C9
	for <nbd@other.debian.org>; Tue, 17 Feb 2026 12:18:10 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4836f363ad2so46467835e9.1
        for <nbd@other.debian.org>; Tue, 17 Feb 2026 04:18:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771330688; x=1771935488; darn=other.debian.org;
        h=mime-version:user-agent:references:message-id:date:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QTONtFoNtbkbeYo5PUcTqFHZpngRg049E98Be51k7a0=;
        b=hFVbPo1CPGuZt0LXdnrY6ivKU3fsBPibj5JSM8vX2GJZ4il2+NXu8bVkeiowbk0BRV
         eG//i7IadK4ZT1Nbz6JDUvbzDbpN45G2VtyE027wg0cXxsWTCf4n3mXscYI1PdY92y4Y
         7XjyOAnlncplF340pujZJkUHH0GpSRQMavtpdO537HUgurxU5v2qgb7rCZJgFtUr7I98
         WQus45yBbavJKXTK1RDHqUBxRcI2nvxPaSXmBYGNuYpDvAy6YmEFWje/g1k26tNVsgnE
         Q8zQl5h4eEyXjNqamgRWKxsZWwPDM0/yP5rux/3Nv9m6hCXmiES18rFilv1KglZAWEiq
         LyZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771330688; x=1771935488;
        h=mime-version:user-agent:references:message-id:date:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QTONtFoNtbkbeYo5PUcTqFHZpngRg049E98Be51k7a0=;
        b=NwrjukDoKqnupmPyh3/dkZvTCKTi5O9UfDCEJkuxVXOjIlk96SjIlROl8NTutv4GUC
         Z1h5Bv+ZfA7CDImcnRDvO41o+O1ZWwjJrNMmyAzxpXBDRSPOqXZap5PHhBnMl12qVMXS
         NmtddaSueh8vFqVpUK1OyhE5UzldlzqcPniLuO929KyzdcXhmlXRu3bCGjzmVmwkAroV
         aheBJ+JsJE1P491ahEKeSZfn0AZuUlW9tiiTUDgY2/ZBRMsnW0GpP8g6FNJ5x+IwAhr8
         x5wC07bkAqSdiNVacR4CWxzBU8dlHOpcCI3wiEHfD84TFTGZ7II19dP5A08AvQJJRQmX
         INfg==
X-Forwarded-Encrypted: i=1; AJvYcCXA/nn/3no86RxWgC1xcr5kVLS4xL1YaqFjMx/FUZehp0TFREGG6naMPzIzfc+qQCEkGhM=@other.debian.org
X-Gm-Message-State: AOJu0YyOJDVLgexix4DDJylUYhGL2kGKe+TbFOC9SWPnp/jgDp0F7xqU
	QKMZTHVGas7zYxsJ9GLnwKj5NO/H/nM6I57m886vyH+aMv4LSewDI7py0X0O9Q==
X-Gm-Gg: AZuq6aIFpJE/wBnSwhcyNwEyIVcQ3VWPGjCRYe1vFonJq4fXCo7TDGvMHIxhRfQYeC8
	VGc2xDwDSalCtBl1V2sH6RH+kKrQ9ufRkJ+yTvjcpMpuwOQLA6SEldB+87f+6Ik8pcjZQ3Hwz9H
	vcsbL5meJ6b+RYIO5v4S9+QlStFNnrcrH06K+MDzqktBYd/+1F2ygfh5XNXtbe+KU+HFzGLS0wi
	VbBZv/zuNeGYYld7lnWU5lF/4t1qGyzNL2qUDfciv/4tRjcgIrp2Ks/YHc0zQkQsk1a+OD6GJkc
	V2QwNGUfFdm1onFsTtQYgB/joTTNGRmmb0jDLeO5p1l9j9a1tbJuf7bNMnhM7LE7SFCj+DgCdIi
	X4JmsewFbsth7C+pwUU5AC8cTRvsaPQ1mhXcaPqtatZrW1IdD/CDpuXdJWWh0GgG+xqVHFQ5O/Z
	1WSPU/nk51W9ZxBksFXvZazoTZDG0ZjomU67EH0EwQpZYEzA==
X-Received: by 2002:a05:600c:6990:b0:483:8f38:a928 with SMTP id 5b1f17b1804b1-4838f38a961mr40324805e9.34.1771330687636;
        Tue, 17 Feb 2026 04:18:07 -0800 (PST)
Received: from imac ([2a02:8010:60a0:0:7dc3:4609:42c2:f18f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4834d834ebesm525985725e9.13.2026.02.17.04.18.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 04:18:07 -0800 (PST)
From: Donald Hunter <donald.hunter@gmail.com>
To: Hristo Venev <hristo@venev.name>
Cc: Jakub Kicinski <kuba@kernel.org>,  "David S. Miller"
 <davem@davemloft.net>,  Eric Dumazet <edumazet@google.com>,  Paolo Abeni
 <pabeni@redhat.com>,  Simon Horman <horms@kernel.org>,
  netdev@vger.kernel.org,  Josef Bacik <josef@toxicpanda.com>,  Jens Axboe
 <axboe@kernel.dk>,  linux-block@vger.kernel.org,  nbd@other.debian.org
Subject: Re: [PATCH] netlink: specs: add specification for NBD
In-Reply-To: <20260215180309.2255721-3-hristo@venev.name>
Date: Tue, 17 Feb 2026 12:17:25 +0000
Message-ID: <m2o6lnlg2y.fsf@gmail.com>
References: <20260215180309.2255721-3-hristo@venev.name>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <R6S6SHltiZL.A.-eJH.7CGlpB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3494
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/m2o6lnlg2y.fsf@gmail.com
Resent-Date: Tue, 17 Feb 2026 12:36:11 +0000 (UTC)
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.61 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[82.195.75.100:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:hristo@venev.name,m:kuba@kernel.org,m:davem@davemloft.net,m:edumazet@google.com,m:pabeni@redhat.com,m:horms@kernel.org,m:netdev@vger.kernel.org,m:josef@toxicpanda.com,m:axboe@kernel.dk,m:linux-block@vger.kernel.org,m:nbd@other.debian.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[donaldhunter@gmail.com,bounce-nbd=lists@other.debian.org];
	TAGGED_FROM(0.00)[nbd=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORWARDED(0.00)[lists-other-nbd@bendel.debian.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[venev.name:email,bendel.debian.org:helo,bendel.debian.org:rdns];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[donaldhunter@gmail.com,bounce-nbd=lists@other.debian.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:8365, ipnet:82.195.64.0/19, country:DE];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[nbd];
	R_SPF_NA(0.00)[no SPF record]
X-Rspamd-Queue-Id: 146EC14C03B
X-Rspamd-Action: no action

Hristo Venev <hristo@venev.name> writes:

> This patch adds an initial YNL specification for NBD. The specification
> can be used to produce a UAPI header that is equivalent to the one
> currently shipped in the kernel.
>
> The spec appears to be accurate enough so that commands can be issued
> with pyynl.
>
> Signed-off-by: Hristo Venev <hristo@venev.name>
> ---
>  Documentation/netlink/specs/nbd.yaml | 206 +++++++++++++++++++++++++++
>  1 file changed, 206 insertions(+)
>  create mode 100644 Documentation/netlink/specs/nbd.yaml

There are yamllint errors:

make -C tools/net/ynl lint
make: Entering directory '/home/donaldh/net-next/tools/net/ynl'
yamllint ../../../Documentation/netlink/specs
../../../Documentation/netlink/specs/nbd.yaml
  159:81    error    line too long (104 > 80 characters)  (line-length)
  169:6     error    syntax error: expected <block end>, but found '<block mapping start>' (syntax)
  170:7     error    wrong indentation: expected 5 but found 6  (indentation)

>
> diff --git a/Documentation/netlink/specs/nbd.yaml b/Documentation/netlink/specs/nbd.yaml
> new file mode 100644
> index 0000000000000..a84912a867d91
> --- /dev/null
> +++ b/Documentation/netlink/specs/nbd.yaml
> @@ -0,0 +1,206 @@
> +# SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR BSD-3-Clause)
> +---
> +name: nbd
> +protocol: genetlink-c
> +uapi-header: linux/nbd-netlink.h
> +doc: See :file:`drivers/block/nbd.c`

Prefer to see a meaningful doc string here.

> +
> +c-family-name: nbd-genl-family-name
> +c-version-name: nbd-genl-version
> +max-by-define: true
> +
> +attribute-sets:
> +  -
> +    name: nbd-attrs
> +    name-prefix: nbd-attr-
> +    doc: Configuration policy attributes, used for CONNECT
> +    attributes:
> +      -
> +        name: unspec
> +        value: 0
> +        type: unused

No need for unspec in the attribute list, ynl codegen does the right thing.

> +      -
> +        name: index
> +        type: u32
> +      -
> +        name: size-bytes
> +        type: u64
> +      -
> +        name: block-size-bytes
> +        type: u64
> +      -
> +        name: timeout
> +        type: u64
> +      -
> +        name: server-flags
> +        type: u64
> +      -
> +        name: client-flags
> +        type: u64
> +      -
> +        name: sockets
> +        type: nest
> +        nested-attributes: sock-item-attrs
> +      -
> +        name: dead-conn-timeout
> +        type: u64
> +      -
> +        name: device-list
> +        type: nest
> +        nested-attributes: device-item-attrs
> +      -
> +        name: backend-identifier
> +        type: string
> +  -
> +    name: device-item-attrs
> +    name-prefix: nbd-device-item-
> +    doc: |
> +      This is the format for multiple devices with :code:`NBD_ATTR_DEVICE_LIST`
> +
> +      .. code-block::
> +
> +        [NBD_ATTR_DEVICE_LIST]
> +          [NBD_DEVICE_ITEM]
> +            [NBD_DEVICE_INDEX]
> +            [NBD_DEVICE_CONNECTED]
> +    attributes:
> +      -
> +        name: unspec
> +        value: 0
> +        type: unused

Not required.

> +      -
> +        name: item
> +        name-prefix: nbd-device-
> +        type: nest
> +        nested-attributes: device-attrs
> +        multi-attr: true
> +  -
> +    name: device-attrs
> +    name-prefix: nbd-device-
> +    attr-max-name: nbd-device-attr-max
> +    attributes:
> +      -
> +        name: unspec
> +        value: 0
> +        type: unused

Not required.

> +      -
> +        name: index
> +        type: u32
> +      -
> +        name: connected
> +        type: u8
> +  -
> +    name: sock-item-attrs
> +    name-prefix: nbd-sock-item-
> +    doc: |
> +      This is the format for multiple sockets with :code:`NBD_ATTR_SOCKETS`
> +
> +      .. code-block::
> +
> +        [NBD_ATTR_SOCKETS]
> +          [NBD_SOCK_ITEM]
> +            [NBD_SOCK_FD]
> +          [NBD_SOCK_ITEM]
> +            [NBD_SOCK_FD]
> +    attributes:
> +      -
> +        name: unspec
> +        value: 0
> +        type: unused

Not required.

> +      -
> +        name: item
> +        name-prefix: nbd-sock-
> +        type: nest
> +        nested-attributes: sock-attrs
> +        multi-attr: true
> +  -
> +    name: sock-attrs
> +    name-prefix: nbd-sock-
> +    attributes:
> +      -
> +        name: unspec
> +        value: 0
> +        type: unused

Not required.

> +      -
> +        name: fd
> +        type: u32
> +
> +operations:
> +  enum-model: unified
> +  name-prefix: nbd-cmd-
> +  list:
> +    -
> +      name: unspec
> +      value: 0
> +      doc: NBD_CMD_UNSPEC

Not required.

> +    -
> +      name: connect
> +      doc: See :file:`drivers/block/nbd.c`, :code:`nbd_genl_connect()`

Prefer to see meaningful doc string (same for other ops)

> +      attribute-set: nbd-attrs
> +      dont-validate: [strict]

nbd.c has strict & dump, should this be [strict, dump] ? (same for other ops)

> +      do:
> +        request:
> +          attributes:
> +            - index
> +            - size-bytes
> +            - block-size-bytes
> +            - timeout
> +            - server-flags
> +            - client-flags
> +            - sockets
> +            - dead-conn-timeout
> +            - backend-identifier
> +        reply:
> +          attributes:
> +            - index
> +    -
> +      name: disconnect
> +      doc: See :file:`drivers/block/nbd.c`, :code:`nbd_genl_disconnect()`
> +      attribute-set: nbd-attrs
> +      dont-validate: [strict]
> +      do:
> +        request:
> +          attributes:
> +            - index
> +    -
> +      name: reconfigure
> +      doc: See :file:`drivers/block/nbd.c`, :code:`nbd_genl_reconfigure()`
> +      attribute-set: nbd-attrs
> +      dont-validate: [strict]
> +      do:
> +        request:
> +          attributes:
> +            - index
> +            - size-bytes
> +            - block-size-bytes
> +            - timeout
> +            - client-flags
> +            - sockets
> +            - dead-conn-timeout
> +            - backend-identifier
> +    -
> +      name: link-dead
> +      doc: See :file:`drivers/block/nbd.c`, :code:`nbd_mark_nsock_dead()` / :code:`nbd_dead_link_work()`
> +      attribute-set: nbd-attrs
> +      event:
> +        attributes:
> +          - index
> +      mcgrp: nbd_mc_group
> +    -
> +      name: status
> +      doc: See :file:`drivers/block/nbd.c`, :code:`nbd_genl_status()`
> +      attribute-set: nbd-attrs
> +      dont-validate: [strict]
> +      do:
> +        request:
> +          attributes:
> +            - index
> +        reply:
> +          attributes:
> +            - device-list
> +
> +mcast-groups:
> +  list:
> +    -
> +      name: nbd_mc_group
> +      c-define-name: nbd-genl-mcast-group-name

